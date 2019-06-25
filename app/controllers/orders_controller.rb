class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :reset_status]

  def index
    @orders = Order.where(user: current_user, status: 1).order(created_at: :desc)
  end

  def show
    @user = User.find(@order.user_id)
    @product_orders = @order.product_orders
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
    if (@order.user == current_user && @order.selling_range == current_selling_range)
      @order.status = 0
      @order.save
      flash[:notice] = "Attention, votre commande doit être validée à nouveau pour être prise en compte"
      redirect_to products_path
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
