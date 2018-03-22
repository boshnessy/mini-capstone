class AddAdminToUsersWDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :admin, :boolean, default: true
  end
end
