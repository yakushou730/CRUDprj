class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    # @books = Book.all
    @books = Book.page(params[:page]).per(10)
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def edit

  end

  def update
    @book.update(book_params)
    redirect_to books_path
  end

  def destroy
    @book.destroy

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
