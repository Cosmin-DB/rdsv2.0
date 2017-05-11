
class AddAvatarToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :avatar, :string
  end
end
