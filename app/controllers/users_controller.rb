class UsersController < ApplicationController

  def index
    @users = User.all
    @book = Book.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
    redirect_to user_path(current_user.id)
  else
    render :index
  end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
     render "edit"
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  else
    render :edit
  end
  end

  private

  def user_params
   params.require(:user).permit(:name, :introduction, :profile_image)
  end
end