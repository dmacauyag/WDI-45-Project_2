class FoldersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @folder = Folder.find(params[:folderid])
    @user_folders = User.find(params[:id])
  end

  def new
    if current_user.id == params[:id].to_i
      @folder = current_user.folders.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @folder = current_user.folders.new(folder_params)
    @folder.user = current_user
    if @folder.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @folder = Folder.find(params[:folderid])
  end

  def update
    @folder = Folder.find(params[:folderid])
    if @folder.update_attributes(folder_params)
      redirect_to folder_path(:id => current_user.id, :folderid => params[:folderid])
    else
      redirect_to edit_folder_path(:id => current_user.id, :folderid => params[:folderid])
    end
  end

  def destroy
    @folder = Folder.find(params[:folderid])
    if @folder.destroy
      redirect_to user_path(current_user)
    end
  end

  private
  def folder_params
    params.require(:folder).permit(:name)
  end
end
