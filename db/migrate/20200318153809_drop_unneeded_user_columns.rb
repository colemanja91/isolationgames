class DropUnneededUserColumns < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :zipcode
      t.remove :country
    end
  end
end
