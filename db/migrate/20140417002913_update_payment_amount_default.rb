class UpdatePaymentAmountDefault < ActiveRecord::Migration
  def change
    change_column :orders, :payment_amount, :decimal, precision: 10, scale: 2, null: false, default: 0.0
  end
end
