class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :text
      t.string :type_notification
      t.belongs_to :user, class_name: "User" , foreign_key: :user_id
			t.belongs_to :receiver, class_name: "User"
      t.timestamps
    end
  end
end
