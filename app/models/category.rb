class Category < ApplicationRecord
  has_many :products
  has_many :product_orders, through: :products

  validates :name, presence: true

  def period_sales_for(period)
    product_orders.joins(:order).where("orders = ? AND orders.status = ?", year, 1).sum(:item_price)
  end

  def week_sales_for(year, week)
    product_orders.joins(:order).where("orders.year_number = ? AND orders.week_number = ? AND orders.status = ?", year, week, 1).sum(:item_price)
  end

  def year_crops_for(year)
    product_orders.joins(:order).where("orders.year_number = ? AND orders.status = ?", year, 1).sum(:quantity)
  end

end
