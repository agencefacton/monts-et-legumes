class SellingRange < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders

  def quantity_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:quantity)
  end

  def sales_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:item_price)
  end

  def total_sales
    orders.where("status = ?", 1).sum(:total_price)
  end

  def self.next
    where('starts_at > ?', DateTime.current).order(starts_at: :asc).first
  end
end
