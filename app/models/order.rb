class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders, dependent: :destroy
  belongs_to :user
  before_create :set_status
  after_touch :update_total
  before_save :update_week

  def calculate_total
    self.product_orders.sum(:item_price).to_f
  end

  def set_status
    self.status = 0
  end

  def update_status
    self.status = 1
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
    self.year_number = Date.current.year
end
