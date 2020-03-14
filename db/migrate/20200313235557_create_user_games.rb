class CreateUserGames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_games do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :game, null: false, foreign_key: true
      t.timestamps
      t.integer :status, null: false
      t.timestamp :joined_at, null: false
      t.timestamp :left_at, null: true
    end
  end
end
