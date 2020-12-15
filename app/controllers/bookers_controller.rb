class BookersController < ApplicationController
  def new
   
    @book = Book.new
  end

  def index
    logger.debug('enter index')
    @books = Book.all
    @book = Book.new
    @error = flash[:error]
  end

  def show
    @book = Book.find(params[:id])
    @notice = flash[:notice]
    @error = flash[:error]
  end

  def create
    book = Book.new(book_params)
    if book.save
      message = "Book was successfully created."
      flash[:notice] = message
      redirect_to book_path(Book.last)
    else
      message = "can't be blank Mandatory input data was missing error."
      flash[:error] = message
      redirect_to action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      message = "Book was successfully updated."
      flash[:notice] = message
    else
      message = "can't be blank Mandatory input data was missing error."
      flash[:error] = message
    end
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  
    book.destroy 
    redirect_to books_path  
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end