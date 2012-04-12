class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :plant_id, :quantity
  
  belongs_to :order
  belongs_to :plant
end
