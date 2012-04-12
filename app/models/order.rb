class Order < ActiveRecord::Base
  attr_accessible :customer_id
  
  has_many :line_items
end
