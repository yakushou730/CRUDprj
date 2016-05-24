class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index

    if params[:eid]
      @book = Book.find(params[:eid])
    else
      @book = Book.new
    end

    @books = Book.page(params[:page]).per(10)

  end

  def show
    @page_title = @book.name
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "create success"
      redirect_to books_path
    else
      render 'new'
    end

  end

  def edit

  end

  def update

    if @book.update(book_params)
      flash[:notice] = "update success"
      redirect_to books_path
    else
      render 'edit'
    end

  end

  def destroy
    @book.destroy

    flash[:alert] = "delete success"

    redirect_to books_path
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:name, :description, :isbn)
  end
end
