class CreateGameRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :game_rounds do |t|
      t.timestamps
      t.belongs_to :game, null: false, index: true, foreign_key: true
      t.belongs_to :black_card, null: false, index: true, foreign_key: true
      t.integer :round, null: false
      t.integer :status, null: false
      t.references :user, column: :judge_user_id, null: false, foreign_key: true
      t.timestamp :started_at
      t.timestamp :closed_at
      t.timestamp :ended_at
      t.references :user_card, column: :winner_user_card, foreign_key: true
    end
  end
end
