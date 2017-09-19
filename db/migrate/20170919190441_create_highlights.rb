class CreateHighlights < ActiveRecord::Migration[5.0]
  def change
    create_table :highlights do |t|
      t.belongs_to :user, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
