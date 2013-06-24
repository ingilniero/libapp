class BooksController < ApplicationController
  before_filter :find_book, only: [:show]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to books_url, notice: "You added a new book into your library"
    else
      flash.now[:error] = "Book without a title is pretty useless"
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
  end

  private
  def book_params
    params.require(:book).permit!
  end

  def find_book
    begin
      @book = Book.find(params[:id])
    rescue
      flash[:error] = "Book doesn't exists"
      redirect_to root_url
    end
  end
end
