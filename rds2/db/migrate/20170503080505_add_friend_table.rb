class AddFriendTable < ActiveRecord::Migration[5.0]
  def change
    create_table :friends, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend ,as: :user, index: true
    end
  end
end