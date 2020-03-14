class CreateWhiteCards < ActiveRecord::Migration[6.0]
  def change
    create_table :white_cards do |t|
      t.timestamps
      t.string :text, null: false
      t.belongs_to :card_set, null: false, index: true, foreign_key: true
    end
  end
end
