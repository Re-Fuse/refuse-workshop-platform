class AddYoutubeToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :youtube_id, :string
    add_column :cues, :youtube_start, :string
    add_column :cues, :youtube_end, :string
  end
end
