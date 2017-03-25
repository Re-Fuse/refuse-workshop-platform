class ChangePostionToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :cues, :position, :integer
  end

  def down
  end
end
