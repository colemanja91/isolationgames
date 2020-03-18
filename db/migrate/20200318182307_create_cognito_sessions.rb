class CreateCognitoSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :cognito_sessions do |t|
      t.belongs_to :user, index: true, null: false
      t.integer :expire_time, null: false
      t.integer :issued_at, null: false
      t.string :audience, null: false
      t.string :refresh_token, null: false

      t.timestamps
    end
  end
end
