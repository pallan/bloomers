class Order < ActiveRecord::Base

  STATUS = ['open','closed','cancelled']

  # attr_accessible :customer_name, :customer_phone, :payment_method, :cheque_number, :status, :payment_amount

  has_many :line_items
  belongs_to :group

  def total
    line_items.sum("quantity * price").to_i/100.0
  end

  def balance
    total - payment_amount
  end

  def number
    "#{group.label}-#{id}"
  end
end
