class FixUserCardsGameRoundsRelation < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_rounds, :user_card_id, :bigint
    add_column :user_cards, :winner, :boolean, null: false, default: false
  end
end
