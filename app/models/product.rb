class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  has_many :sales
  belongs_to :category

  validates :name, :price, :unit, presence: true

  mount_uploader :photo, PhotoUploader

  def year_crops_for(year)
    product_orders
      .joins(order: :selling_range)
      .where("extract(year from selling_ranges.ends_at) = ? AND orders.status = ?", year, 1)
      .sum(:quantity)
  end

  def selling_range_crops_for(selling_range)
    product_orders
      .joins(order: :selling_range)
      .where("selling_ranges.id = ? AND orders.status = ?", selling_range.id, 1)
      .sum(:quantity)
  end
end
