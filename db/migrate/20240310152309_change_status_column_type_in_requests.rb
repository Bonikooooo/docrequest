class AddColumnStatusInRequests < ActiveRecord::Migration[7.1]
  def change
    change_column :requests, :status, :integer
  end
end
