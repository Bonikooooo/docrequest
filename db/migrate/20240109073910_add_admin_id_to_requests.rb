class AddAdminIdToRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :admin_id, :integer
    add_index :requests, :admin_id
  end
end
