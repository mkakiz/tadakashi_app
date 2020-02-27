class AddUserIdToComments < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :user_id, :integer
    change_column :posts, :user_id, :integer, :null => false
  end
  def down
    remove_column :posts, :user_id, :integer
  end
end
