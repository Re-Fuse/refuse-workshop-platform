class RenameYoutubeId < ActiveRecord::Migration[5.0]
  def change
    rename_column :cues, :youtube_id, :youtube_indentifier
  end
end
