class SetGameRoundNumberDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :game_rounds, :round, 0
  end
end
