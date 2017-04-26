class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create, :index]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.folders.create name:'Favorites'
      @user.folders.create name:'Archive'
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(params[:id])
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :full_name, :email, :password, :password_confirmation)
  end
end
