class RemoveIdAdminFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :id_admin
  end
end
