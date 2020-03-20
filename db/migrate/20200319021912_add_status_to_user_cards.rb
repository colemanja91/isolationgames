class AddStatusToUserCards < ActiveRecord::Migration[6.0]
  def change
    add_column :user_cards, :status, :integer, null: false, default: 0
  end
end
