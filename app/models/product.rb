class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders
  has_many :sales
  belongs_to :category

  validates :name, :price, :unit, presence: true

  mount_uploader :photo, PhotoUploader

end
