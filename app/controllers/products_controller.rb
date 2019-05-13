class ProductsController < ApplicationController
  def index
    if !sales_period? && !current_user.admin?
      redirect_to wait_path
    else
      @products = Product.where(active: true)
      @product_orders = current_order.product_orders
      @order = current_order
      @categories = Category.all
      @post = Post.last
    end
  end
end
