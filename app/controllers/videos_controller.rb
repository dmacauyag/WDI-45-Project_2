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
      redirect_to new_post_path
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
      redirect_to edit_video_path(params[:id])
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

  private
  def video_params
    params.require(:video).permit(:title, :description, :source)
  end
end
