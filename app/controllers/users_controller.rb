class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  if @user != current_user
  redirect_to user_path(current_user)
  end
  end

  def sign_up
    @user = User.new
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  def sign_in
    @user = User.new
    flash[:notice] = "Signed in successfully."
  end

  def sign_out
    flash[:notice] = "Signed out successfully."
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
    render :edit
    end

  end

  private

  def user_params

  params.require(:user).permit(:profile_image, :name, :introduction)

  end
end
