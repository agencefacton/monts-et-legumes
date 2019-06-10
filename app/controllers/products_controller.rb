class ProductsController < ApplicationController
  before_action :ensure_selling_range_presence, only: :index

  def index
    redirect_to order_path(current_order) unless current_order.pending?

    @products = Product.where(active: true)
    @product_orders = current_order.product_orders
    @order = current_order
    @categories = Category.order(id: :asc)
    @post = Post.last
  end

  private

  def ensure_selling_range_presence
    unless sales_period? || current_user.admin?
      redirect_to wait_path
    end
  end
end
