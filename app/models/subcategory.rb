class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products
  has_many :product_orders, through: :products

  validates :name, :order, presence: true
  validates :order, presence: true

  def self.ordered
    order(order: :asc)
  end

end
