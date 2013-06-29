class BooksController < ApplicationController
  before_filter :find_book, only: [:show, :edit, :update, :destroy]
  before_filter :require_login, only: [:new, :create]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.reader_id = session[:reader_id]
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

  def edit
    raise AccessDenied unless @book.owned_by?(current_user)
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to books_url, notice: "Book has been updated"
    else
      flash[:error] = "Please, provide title for the book"
      render :edit
    end
  end

  def destroy
    raise AccessDenied unless @book.owned_by?(current_user)
    @book.destroy
    redirect_to books_url
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

  def require_login
    raise AccessDenied unless session[:reader_id]
  end
end
