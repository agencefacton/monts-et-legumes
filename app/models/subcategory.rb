class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products
  has_many :product_orders, through: :products

  validates :name, presence: true

end
