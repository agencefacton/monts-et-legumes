module Admin
  class StatisticsController < Admin::ApplicationController

    def index
      @orders_by_year = Order.joins(:selling_range)
                             .where(status: 1)
                             .group("DATE_TRUNC('year', selling_ranges.ends_at)")
                             .count
      @categories = Category.all
    end

    def show
      @year = params[:year].to_i
      @orders_by_week = Order.joins(:selling_range)
                             .where('status = ? AND extract(year from selling_ranges.ends_at) = ?', 1, @year)
                             .group("DATE_TRUNC('week', selling_ranges.ends_at)")
                             .count
      @categories = Category.all
    end

    private

    def product_order_params
      params.require(:product_order).permit(:quantity, :product_id)
    end

    def set_products
      if current_user.admin?
        @products = Product.order(active: :desc)
      else
        @products = Product.where(active: true)
      end
    end

    def set_product_order
      @product_order = ProductOrder.find(params[:id])
    end

    def set_order
      @order = current_order
    end

    def save_order
      @order.save
    end
  end
end
