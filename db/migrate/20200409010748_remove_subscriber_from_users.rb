# frozen_string_literal: true

class RemoveSubscriberFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :subscriber
  end
end
