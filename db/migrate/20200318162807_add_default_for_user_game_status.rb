class AddDefaultForUserGameStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_games, :status, 0
  end
end
