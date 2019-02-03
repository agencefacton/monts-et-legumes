class Product < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :sales

  validates :name, :price, :unit, :category, presence: true

  mount_uploader :photo, PhotoUploader
end
