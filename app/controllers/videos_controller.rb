class VideosController < ApplicationController
  def index
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    # new video object with info from the form
    @video = Video.new(video_params)

    # make this video belong to the current user that's submitting the form
    @video.user = current_user

    # then try to save it
    if @video.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @video = Video.find(params[:id])
    if @video.destroy
      redirect_to user_path(current_user)
    end
  end

  def folders
    @video = Video.find(params[:id])
    @folders = current_user.folders
  end

  def add_video_to_folder
    @video = Video.find(params[:id])
    @folder = Folder.find(params[:folder_id])

    if !@folder.videos.exists?(@video.id)
      @folder.videos << @video
      flash[:alert] = @video.title + " added to " + @folder.name + " folder."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "That video is already inside the " + @folder.name + " folder."
      redirect_to video_folder_path(@video)
    end
  end

  def remove_video_from_folder
    @video = Video.find(params[:id])
    @folder = Folder.find(params[:folder_id])

    if @folder.videos.delete(@video)
      redirect_to user_path(current_user)
    end
  end

  private
  def video_params
    params.require(:video).permit(:title, :description, :source)
  end
end
