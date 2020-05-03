module Admin
  class StatisticsController < Admin::ApplicationController

    def index
      @orders_by_year = Order.joins(:selling_range)
                             .where(status: 1)
                             .group("DATE_TRUNC('year', selling_ranges.ends_at)")
                             .count
      @sales_by_year =  Order.joins(:selling_range)
                             .where(status: 1)
                             .group("DATE_TRUNC('year', selling_ranges.ends_at)")
                             .sum(:total_price)
      @categories = Category.order(id: :asc)
    end

    def show
      @year = params[:year].to_i
      @orders_by_week = Order.joins(:selling_range)
                             .where('status = ? AND extract(year from selling_ranges.ends_at) = ?', 1, @year)
                             .group("DATE_TRUNC('week', selling_ranges.ends_at)")
                             .count
      @categories = Category.order(id: :asc)
    end

  end
end
