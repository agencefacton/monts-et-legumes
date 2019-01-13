class OrdersController < ApplicationController
before_action :set_order, only: [:show, :edit, :update, :reset_status]

  def index
    @orders = Order.all
    @myorders = Order.where(user: current_user)
  end

  def show
    @user = User.find(@order.user_id)
    @product_orders = @order.product_orders
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if order_params[:status].to_i == 1
      @order.update(order_params)
      @order.save
      redirect_to order_path
    else
      @order.product_orders.destroy_all
      @order.update(order_params)
      @order.save
      redirect_to products_path
    end
  end

  def reset_status
    @order.status = 0
    @order.save
    redirect_to products_path
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
