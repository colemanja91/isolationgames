class AddCognitoDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscriber, :string, null: false, index: { unique: true }
    add_column :users, :email, :string, null: false, index: { unique: true }
    remove_column :users, :phone_number
  end
end
