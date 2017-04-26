class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize, :video_source, :youtube_embed

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      redirect_to new_session_path
    end
  end

  # Checks the source of the video and applies the proper function to extract embed code
  def video_source(str)
    if str.include? 'www.youtube.com'
      return youtube_embed(str)
    elsif str.include? 'youtu.be'
      return youtube_embed(str)
    else
      return nil
    end
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    return "http://www.youtube.com/embed/#{ youtube_id }"
  end

end
