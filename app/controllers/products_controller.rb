class ProductsController < ApplicationController
  def index
    @products = Product.where(active: true)
    @product_orders = current_order.product_orders
    @order = current_order
    @categories = Category.all
    @post = Post.last
  end
end
