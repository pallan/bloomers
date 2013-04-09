class UpdatePaymentAmountToDecimal < ActiveRecord::Migration
  def change
    change_column :orders, :payment_amount, :decimal, default: 0.0
  end
end
