class AddSubtitleToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :subtitle, :string
    add_column :cues, :text, :string
  end
end
