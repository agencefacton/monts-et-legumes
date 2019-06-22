class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  has_many :sales
  belongs_to :category

  validates :name, :price, :unit, presence: true

  mount_uploader :photo, PhotoUploader

  def self.active
    where(active: true)
  end

  def self.ordered
    order(name: :asc)
  end

  def self.with_order_for(selling_range)
    joins(:orders).where(orders: { status: 1, selling_range_id: selling_range.id }).distinct
  end

  def product_orders_for(selling_range)
    product_orders.joins(:order)
                  .where("orders.selling_range_id = ? AND orders.status = ?", selling_range.id, 1)
  end

  def general_sales_for
    product_orders.joins(:order)
                  .where("orders.status = ?", 1).sum(:item_price)
  end

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

  def general_crops_for
    product_orders.joins(:order)
                  .where("orders.status = ?", 1).sum(:quantity)
  end

  def year_crops_for(year)
    this_year = DateTime.new(year)
    next_year = DateTime.new(year + 1)
    product_orders.joins(order: :selling_range)
                  .where("selling_ranges.ends_at >= ? AND selling_ranges.ends_at < ? AND orders.status = ?", this_year, next_year, 1)
                  .sum(:quantity)
  end

  def selling_range_crops_for(selling_range)
    product_orders.joins(order: :selling_range)
                  .where("orders.selling_range_id = ? AND orders.status = ?", selling_range , 1)
                  .sum(:quantity)
  end



end
