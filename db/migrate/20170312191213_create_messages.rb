class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :value
      t.belongs_to :user, foreign_key: true
      t.belongs_to :room, foreign_key: true

      t.timestamps
    end
  end
end
