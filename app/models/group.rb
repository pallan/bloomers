class Group < ActiveRecord::Base
  attr_accessible :label

  has_many :orders
end
