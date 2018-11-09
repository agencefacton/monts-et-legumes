class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  before_create :update_price

  def update_price
    self.item_price = self.product.price.to_f * self.quantity.to_f
  end

end
