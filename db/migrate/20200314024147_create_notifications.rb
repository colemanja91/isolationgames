class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.timestamps
      t.belongs_to :user, null: false, foreign_key: true
      t.string :message_body, null: false
      t.integer :message_type, null: false
      t.integer :directionality, null: false
      t.string :media_url, null: true
    end
  end
end
