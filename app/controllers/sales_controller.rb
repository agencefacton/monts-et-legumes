class SalesController < ApplicationController
  before_action :set_sale, only: [:edit, :update, :destroy]

  def index
    @sales = Order.group(:week_number).count
  end

  def show
    @sale = Sale.new
    @products = Product.joins(product_orders: :order).where('orders.week_number = ?', params[:week_number]).where('orders.status = ?', 1).uniq
    @sales = Sale.where(week_number: params[:week_number])
  end


  def new
    @sale = Sale.new
    @products = Product.all
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to sales_path(params[:week_number])
    else
      render :show
    end
  end

  def edit
    @products = Product.all
  end

  def update
    @sale.update(sale_params)
    redirect_to sales_path
  end

  def destroy
    @sale.destroy
    redirect_to sales_path
  end

  private

  def sale_params
    params.require(:sale).permit(:product_id, :week_number, :item_price, :quantity, :mayeres)
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

end
