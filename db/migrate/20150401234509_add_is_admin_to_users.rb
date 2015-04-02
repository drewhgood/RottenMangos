class AddIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, :boolean, :default => false
  end
end
