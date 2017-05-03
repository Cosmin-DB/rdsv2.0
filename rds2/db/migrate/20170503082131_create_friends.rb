class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends, id: false do |t|
      t.references :user, index: true
      t.references :friend,as: :user, index: true
    end
  end
end
