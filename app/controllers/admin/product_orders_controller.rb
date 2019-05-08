module Admin
  class ProductOrdersController < Admin::ApplicationController

    def create
        @categories = Category.all
        if product_order_params[:quantity].to_i > 0
          @product_order = @order.product_orders.create(product_order_params)
        end
        @product_order.save
        @product_orders = current_order.product_orders
        @post = Post.last
      end

      def destroy
        @product_order.destroy
        redirect_to products_path
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


  end
end
