class Category < ApplicationRecord
  has_many :products
  has_many :product_orders, through: :products

  validates :name, presence: true

  def selling_range_sales_for(selling_range)
    product_orders.joins(:order).where("orders = ? AND orders.status = ?", year, 1).sum(:item_price)
  end

  def selling_range_crops_for(selling_range)
    product_orders
      .joins(order: :selling_range)
      .where("selling_ranges.id = ? AND orders.status = ?", selling_range.id, 1)
      .sum(:quantity)
  end

end

