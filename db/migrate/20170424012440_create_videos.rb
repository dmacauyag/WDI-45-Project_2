class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :source
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
