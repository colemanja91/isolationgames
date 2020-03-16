class AddMessageDetailsToNotifications < ActiveRecord::Migration[6.0]
  def change
    change_table :notifications do |t|
      t.string :sms_message_sid, null: false
      t.string :message_sid, null: false
      t.string :account_sid, null: false
      t.string :from_state, null: true
      t.string :from_city, null: true
      t.string :from_country, null: true
      t.string :from_zip, null: true
    end
  end
end
