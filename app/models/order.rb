class Order < ApplicationRecord
  has_many :product_orders
  before_save :update_total

  def calculate_total
    self.product_orders.collect { |item| item.product.price * item.quantity }.sum
  end

private

  def update_total
    self.invoiced = calculate_total
  end
end
