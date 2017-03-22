class AddGestureToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :gesture, :integer, default: 0
  end
end
