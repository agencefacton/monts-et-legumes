class Order < ApplicationRecord
  has_many :product_orders
  before_create :set_status
  before_save :update_total
  before_save :update_date

  def calculate_total
    self.product_orders.collect { |item| item.product.price * item.quantity }.sum
  end

  def set_status
    self.status = 0
  end

  def update_status
    self.status = 1
  end


private

  def update_total
    self.invoiced = calculate_total
  end

  def update_date
    self.date = Time.now.strftime("%U").to_i
  end
end
