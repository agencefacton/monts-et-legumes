class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders, dependent: :destroy
  has_many :categories, through: :products
  belongs_to :user
  belongs_to :selling_range

  validates :selling_range, uniqueness: { scope: :user }

  after_touch :update_total

  def self.validated
    where(status: 1)
  end

  def calculate_by(category)
    product_orders.joins(:product).where("products.category_id = ?", category.id).sum(:item_price).to_f
  end

  def calculate_total
    product_orders.sum(:item_price).to_f
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
