class CreateUserRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rounds do |t|
      t.timestamps
      t.belongs_to :game_round, null: false
      t.belongs_to :user_game, null: false
      t.boolean :winner, null: false, default: false
    end

    remove_column :user_cards, :winner, :boolean
    remove_reference :user_cards, :game_round
    add_reference :user_cards, :user_round, null: true
    add_foreign_key :user_cards, :user_rounds
  end
end
