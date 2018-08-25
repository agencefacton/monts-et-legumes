class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders
  belongs_to :user
  before_create :set_status
  before_save :update_total
  before_save :update_date

  def calculate_total
    self.product_orders.collect { |item| item.item_price }.sum
  end

  def set_status
    self.status = 0
  end

  def update_status
    self.status = 1
  end

  def contains?(product)
    products.include?(product)
  end

private

  def update_total
    self.invoiced = calculate_total
  end

  def update_date
    self.date = Time.now.strftime("%U").to_i
  end
end
