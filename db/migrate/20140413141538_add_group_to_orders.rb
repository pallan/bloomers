class AddGroupToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :group_id, :integer
    add_index :orders, :group_id
  end
end
