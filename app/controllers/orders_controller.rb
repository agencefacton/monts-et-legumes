class OrdersController < ApplicationController

  def index
  end

  def show
    @product_orders = current_order.product_orders
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
