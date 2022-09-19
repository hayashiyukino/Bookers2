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
      # else
      #   #↓アプリケーションを完成させよう9章の内容↓
      #   @books = Book.all
      #   render :index  #投稿一覧ページを再表示
      end
  end


  def index
  end

  def show
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
