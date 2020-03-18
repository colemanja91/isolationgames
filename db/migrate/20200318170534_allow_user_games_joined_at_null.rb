class AllowUserGamesJoinedAtNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_games, :joined_at, true
  end
end
