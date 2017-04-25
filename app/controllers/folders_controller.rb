class FoldersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @folder = Folder.find(params[:folderid])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
