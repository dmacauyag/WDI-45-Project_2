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

    # make this post belong to the current user that's submitting the form
    @video.user = current_user

    # then try to save it
    if @video.save
      redirect_to user_path(@user)
    else
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def video_params
    params.require(:video).permit(:title, :description, :source)
  end
end
