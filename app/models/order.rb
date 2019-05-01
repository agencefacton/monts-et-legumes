class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders, dependent: :destroy
  has_many :categories, through: :products
  belongs_to :user
  belongs_to :selling_range
  before_create :set_status
  after_touch :update_total
  validates :selling_range, uniqueness: { scope: :user }

  def self.validated
    where(status: 1)
  end

  def calculate_total
    self.product_orders.sum(:item_price).to_f
  end

  def set_status
    self.status = 0
  end

  def update_status
    self.status = 1
  end

  def pending?
    status != 1
  end

  def contains?(product)
    products.include?(product)
  end

  private

  def update_total
    self.total_price = calculate_total
    save
  end
end
