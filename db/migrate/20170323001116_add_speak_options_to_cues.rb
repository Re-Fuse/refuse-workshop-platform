class AddSpeakOptionsToCues < ActiveRecord::Migration[5.0]
  def change
    add_column :cues, :speak_options, :string
  end
end
