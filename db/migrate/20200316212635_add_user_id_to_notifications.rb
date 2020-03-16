class AddUserIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    change_table :notifications do |t|
      t.belongs_to :user, null: true
    end
  end
end
