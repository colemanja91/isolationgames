class SetGameRoundStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :game_rounds, :status, 0
  end
end
