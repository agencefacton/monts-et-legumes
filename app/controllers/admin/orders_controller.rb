module Admin
  class OrdersController < Admin::ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
      @product_orders = @order.product_orders
      @user = @order.user
    end

    def create
      @user = User.find(params[:user_id])
      @order = Order.find_or_create_by(user: @user, selling_range: current_selling_range)
      if current_selling_range
        redirect_to edit_admin_order_path(@order)
      end
    end

    def edit
      @categories = Category.all
      @product_orders = @order.product_orders
    end

    def update
      if order_params[:status].to_i == 1
        @order.update(order_params)
        @order.save
        redirect_to admin_order_path
      else
        @order.product_orders.destroy_all
        @order.update(order_params)
        @order.save
        redirect_to products_path
      end
    end

    def destroy
      @user = @order.user
      @order.destroy
      redirect_to admin_user_path(@user)
    end

    private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:status)
    end

  end
end
