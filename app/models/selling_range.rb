class SellingRange < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders

  def quantity_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:quantity)
  end

  def sales_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:item_price)
  end
end
