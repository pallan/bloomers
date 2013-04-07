class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string, :limit => 15
  end
end