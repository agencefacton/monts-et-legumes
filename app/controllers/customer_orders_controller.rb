class CustomerOrdersController < ApplicationController

  def index
    @product_orders = ProductOrder.joins(:product, :order).where("status = ?", 1)
    @orders = Order.where("status = ?", 1)
  end
end
