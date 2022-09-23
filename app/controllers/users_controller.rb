class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    @book = Book.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
   end

   def index
     @users = User.all
     #部分テンプレートを使えるようにする（＊current_userはログイン中のユーザーを指している）
     @user = current_user
     @book = Book.new
   end

  private

   def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
   end
end
