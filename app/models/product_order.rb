class ProductOrder < ApplicationRecord
  belongs_to :product
  has_one :category, through: :product
  belongs_to :order, touch: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true }, if: :integer_unit
  before_save :update_price

  def self.with_category(category)
    joins(:product).where(products: { category: category })
  end

  def self.ordered
    joins(:product).order("products.name")
  end

  def update_price
    self.item_price = (self.product.price.to_f * self.quantity.to_f).round(2)
  end

  def integer_unit
    ["pièce", "sixaine", "litre", "pot"].include?(product.unit)
  end
end
