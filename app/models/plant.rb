class Plant < ActiveRecord::Base
  attr_accessible :name, :price, :active
  
  scope :active, -> { where(active: true) }

  has_many :line_items
  has_many :orders, :through => :line_items
  
  def for_select
    "#{name} - $#{'%.2f' % (price/100.0)}"
  end
end
