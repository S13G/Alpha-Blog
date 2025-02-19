class UsersController < ApplicationController
  # before_action:require_login, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to articles_path, :notice => "Welcome to the Alpha Blog #{user.username}, you have successfully signed up"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, :notice => "Your account has been updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Account and all associated articles successfully deleted"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  # def require_login
  # unless logged_in?
  #   redirect_to login_path, :alert => "You must be logged in to perform that action"
  # end
end