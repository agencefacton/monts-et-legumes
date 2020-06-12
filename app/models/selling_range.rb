class SellingRange < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  has_many :categories, -> { distinct }, through: :products
  after_create :send_new_selling_range_email

  def quantity_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:quantity)
  end

  def sales_of(product)
    orders.joins(:products).where('products.id = ? AND status = ?', product.id, 1).sum(:item_price)
  end

  def total_sales
    orders.where("status = ?", 1).sum(:total_price)
  end

  def self.next
    where('starts_at > ?', DateTime.current).order(starts_at: :asc).first
  end

  def send_new_selling_range_email
    User.where(mailable: true).each do |user|
      UserMailer.with(user: user).new_selling_range_email.deliver_later(wait_until: self.starts_at)
    end
  end
end
