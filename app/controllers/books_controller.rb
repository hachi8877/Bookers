class BookersController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
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
      # redirect_to booker_path(book.id)
      redirect_to book_path(Book.last)
    else
      message = "Mandatory input data was missing error."
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
#      redirect_to booker_path(book.id)
    else
      message = "Mandatory input data was missing error."
      flash[:error] = message
    end
    # redirect_to booker_path(book.id)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
