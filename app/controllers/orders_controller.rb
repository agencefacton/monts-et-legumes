class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update]

  def index
    @orders = Order.all
  end

  def show
    # @product_orders = current_order.product_orders
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @order.update(order_params)
    @order.save
    redirect_to order_path
  end

  def destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
