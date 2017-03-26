class AddUSerToCues < ActiveRecord::Migration[5.0]
  def change
    add_reference :cues, :user_id, foreign_key: true
  end
end
