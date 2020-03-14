class UnlinkUsersFromUserCards < ActiveRecord::Migration[6.0]
  def change
    change_table :user_cards do |t|
      t.remove :user_id
      t.remove :game_id
      t.belongs_to :user_game, null: false, foreign_key: true
    end
  end
end
