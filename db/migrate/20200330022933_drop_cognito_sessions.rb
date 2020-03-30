# frozen_string_literal: true

class DropCognitoSessions < ActiveRecord::Migration[6.0]
  def change
    drop_table :cognito_sessions
  end
end
