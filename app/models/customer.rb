class Customer < ActiveRecord::Base
  attr_accessible :name, :phone
  
  has_many :orders
end
