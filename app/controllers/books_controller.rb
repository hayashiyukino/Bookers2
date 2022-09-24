class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
      else
        #↓アプリケーションを完成させよう9章の内容↓
        #render でindexページに飛んだときにアクションを使えるようにする
        @books = Book.all
        @user = current_user
        render "index"  #投稿一覧ページを再表示
        @book = Book.new
      end
  end


  def index
    @books = Book.all
    #部分テンプレートを使えるようにする
    #current_userはログイン中のユーザー
    @user = current_user
    #新しく空のモデルを使う
    @book = Book.new
  end

  def show
    @books = Book.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render "edit"
      @book = Book.find(params[:id])
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
