module Admin
  class OrdersController < Admin::ApplicationController
    before_action :set_order, only: [:show, :edit, :update]

    def index
    end

    def show
      @product_orders = @order.product_orders
      @user = @order.user
    end

    def new
    end

    def create
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
