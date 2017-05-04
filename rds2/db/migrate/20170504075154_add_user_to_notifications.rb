class AddUserToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :receiver, :reference
  end
end
