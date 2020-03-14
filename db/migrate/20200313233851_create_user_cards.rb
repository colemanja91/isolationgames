class CreateUserCards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.timestamps
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :game, null: false, index: true, foreign_key: true
      t.belongs_to :white_card, null: false, index: true, foreign_key: true
    end
  end
end
