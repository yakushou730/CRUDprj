class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index

    @page = params[:page]

    if params[:book_id]
      @book = Book.find(params[:book_id])
    else
      @book = Book.new
    end

    prepare_variable_for_index_template

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
      prepare_variable_for_index_template
      render action: :index
    end

  end

  def edit

  end

  def update

    if @book.update(book_params)
      flash[:notice] = "update success"
      redirect_to books_path
    else
      prepare_variable_for_index_template
      render action: :index
    end

  end

  def destroy
    @book.destroy

    flash[:alert] = "delete success"

    redirect_to books_path(page: params[:page])
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:name, :description, :isbn, :publish_date, :on_store_time)
  end
  def prepare_variable_for_index_template
    @books = Book.page(params[:page]).per(10)
  end
end
