class Order < ActiveRecord::Base
  
  STATUS = ['open','closed','cancelled']
  
  attr_accessible :customer_name, :customer_phone, :payment_method, :cheque_number, :status
  
  has_many :line_items
  
  def total
    line_items.sum("quantity * price").to_i/100.0
  end
end
