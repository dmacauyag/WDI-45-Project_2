class Video < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :folders

  validates :source, presence: { message: "~> Please enter a valid Youtube url."}

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

  before_validation { |video| video.source = video_source(video.source) }

end
