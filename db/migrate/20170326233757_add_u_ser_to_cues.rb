class AddUSerToCues < ActiveRecord::Migration[5.0]
  def change
    add_reference :cues, :user, foreign_key: true
  end
end
