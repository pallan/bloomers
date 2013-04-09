class Order < ActiveRecord::Base
  
  STATUS = ['open','closed','cancelled']
  
  attr_accessible :customer_name, :customer_phone, :payment_method, :cheque_number, :status, :payment_amount
  
  has_many :line_items
  
  def total
    line_items.sum("quantity * price").to_i/100.0
  end

  def balance
    total - payment_amount
  end
end
