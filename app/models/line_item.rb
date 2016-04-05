class LineItem < ActiveRecord::Base
  # attr_accessible :order_id, :plant_id, :quantity

  belongs_to :order
  belongs_to :plant

  validates :quantity, :numericality => { :only_integer => true }

  def subtotal
    quantity * (price/100.0)
  end

  before_create :set_price
  def set_price
    self.price = self.plant.price
  end
end
