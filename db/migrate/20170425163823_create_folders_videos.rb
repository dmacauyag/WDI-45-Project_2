class CreateFoldersVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :folders_videos do |t|
      t.belongs_to :folder, index: true
      t.belongs_to :video, index: true
    end
  end
end
