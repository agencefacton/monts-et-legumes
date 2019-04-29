class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders, dependent: :destroy
  has_many :categories, through: :products
  belongs_to :user
  belongs_to :selling_range
  before_create :set_status
  after_touch :update_total
  before_create :update_week
  before_create :update_year

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

  def update_week
    self.week_number = Time.now.strftime("%U").to_i
  end

  def update_year
    self.year_number = Date.current.year.to_i
  end
end
