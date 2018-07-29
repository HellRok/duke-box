class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :creator_uuid
      t.string :youtube_id
      t.string :title
      t.string :thumbnail
      t.integer :room_id, index: true

      t.timestamps
    end
  end
end
