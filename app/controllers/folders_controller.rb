class FoldersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @folder = Folder.find(params[:folderid])
  end

  def new
    @folder = current_user.folders.new
  end

  def create
    @folder = current_user.folders.new(folder_params)
    @folder.user = current_user
    if @folder.save
      redirect_to user_path(current_user)
    else
      redirect_to new_folder_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def folder_params
    params.require(:folder).permit(:name)
  end
end
