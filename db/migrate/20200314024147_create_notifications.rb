class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.timestamps
      t.string :phone_number, null: false, foreign_key: true
      t.string :message_body, null: false
      t.integer :direction, null: false
      t.string :media_url, null: true
    end
  end
end
