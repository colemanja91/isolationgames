class AddGameRoundToUserCards < ActiveRecord::Migration[6.0]
  def change
    change_table :user_cards do |t|
      t.belongs_to :game_round, foreign_key: true, null: true
    end
  end
end
