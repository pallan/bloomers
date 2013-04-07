class AddOrderColumns < ActiveRecord::Migration
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :customer_phone, :string
    add_column :orders, :payment_method, :string
    add_column :orders, :cheque_number, :integer
  end
end