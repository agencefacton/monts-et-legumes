class Category < ApplicationRecord
  has_many :products
  has_many :product_orders, through: :products

  validates :name, presence: true

  def year_sales_for(year)
    this_year = DateTime.new(year)
    next_year = DateTime.new(year + 1)
    product_orders.joins(order: :selling_range)
                  .where("selling_ranges.ends_at >= ? AND selling_ranges.ends_at < ? AND orders.status = ?", this_year, next_year, 1).sum(:item_price)
  end

  def selling_range_sales_for(selling_range)
    product_orders.joins(order: :selling_range)
                  .where("orders.selling_range_id = ? AND orders.status = ?", selling_range , 1).sum(:item_price)
  end

  def selling_range_crops_for(selling_range)
    product_orders
      .joins(order: :selling_range)
      .where("selling_ranges.id = ? AND orders.status = ?", selling_range.id, 1)
      .sum(:quantity)
  end

end

