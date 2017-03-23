class AddGrouptoCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :room_id, :integer
  end
end
