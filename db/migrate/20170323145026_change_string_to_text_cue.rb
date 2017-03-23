class ChangeStringToTextCue < ActiveRecord::Migration[5.0]
  def change
    change_column :cues, :text, :text
  end
end
