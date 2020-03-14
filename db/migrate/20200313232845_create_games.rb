class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.timestamps
      t.string :name, null: false
      t.belongs_to :user, index: true, foreign_key: true, null: false
      t.integer :status, null: false
      t.timestamp :started_at, null: true
      t.timestamp :ended_at, null: true
    end
  end
end
