class BooksController < ApplicationController
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

  private
  def book_params
    params.require(:book).permit!
  end
end
