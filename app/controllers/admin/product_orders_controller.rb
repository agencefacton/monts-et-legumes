module Admin
  class ProductOrdersController < Admin::ApplicationController
    before_action :set_product_order, only: [:update, :destroy]
    before_action :set_order, only: [:create]
    before_action :set_products, only: [:create, :update]

    def create
        @categories = Category.all
        if product_order_params[:quantity].to_i > 0
          @product_order = @order.product_orders.create(product_order_params)
        end
        @product_order.save
        @product_orders = @order.product_orders
        redirect_to edit_admin_order_path(@order)
      end

      def destroy
        @order = @product_order.order
        @product_order.destroy

        redirect_to edit_admin_order_path(@order)
      end

      def update
        @categories = Category.all
        if product_order_params[:quantity].to_i == 0
          @product_order.destroy
        else
          @product_order.update(product_order_params)
        end
        @product_orders = current_order.product_orders
      end

        private

      def product_order_params
        params.require(:product_order).permit(:quantity, :product_id)
      end

      def set_products
        @products = Product.order(active: :desc)
      end

      def set_product_order
        @product_order = ProductOrder.find(params[:id])
      end

      def set_order
        @order = Order.find(params[:order_id])
      end

      def save_order
        @order.save
      end


  end
end
