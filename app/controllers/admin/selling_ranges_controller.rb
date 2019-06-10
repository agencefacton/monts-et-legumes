module Admin
  class SellingRangesController < Admin::ApplicationController
    before_action :set_selling_range, only: [:edit, :update, :destroy, :show]

    def index
      @selling_ranges = SellingRange.all.order(starts_at: :desc)
    end

    def new
      @selling_range = SellingRange.new
    end

    def create
      @selling_range = SellingRange.new(selling_range_params)

      if @selling_range.save
        redirect_to admin_selling_ranges_path
      else
        render :new
      end
    end

    def destroy
      @selling_range.destroy
      redirect_to admin_selling_ranges_path
    end

    def edit
    end

    def show
      @categories = Category.order(id: :asc)
      @orders = Order.where(selling_range: @selling_range, status: 1)
    end

    def update
      if @selling_range.update(selling_range_params)
        redirect_to admin_selling_ranges_path
      else
        render :edit
      end
    end

    private

    def set_selling_range
      @selling_range = SellingRange.find(params[:id])
    end

    def selling_range_params
      params.require(:selling_range).permit(:starts_at, :ends_at)
    end
  end
end
