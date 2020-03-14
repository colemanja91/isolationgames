class CreateGameCardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :game_card_sets do |t|
      t.belongs_to :card_set, null: false, index: true, foreign_key: true
      t.belongs_to :game, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
