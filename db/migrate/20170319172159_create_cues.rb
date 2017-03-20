class CreateCues < ActiveRecord::Migration[5.0]
  def change
    create_table :cues do |t|
      t.boolean :active
      t.string :name
      t.string :position
      t.string :action
      t.string :duration
      t.string :integer

      t.timestamps
    end
  end
end
