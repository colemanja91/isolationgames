class AddPhoneDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :email
      t.remove :openid
      t.string :phone_number, null: false
      t.string :zipcode, null: true
      t.string :country, null: true
      t.string :name, null: true
    end
  end
end
