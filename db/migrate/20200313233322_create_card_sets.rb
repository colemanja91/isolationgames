class CreateCardSets < ActiveRecord::Migration[6.0]
  def change
    create_table :card_sets do |t|
      t.timestamps
      t.string :name, null: false
    end
  end
end
