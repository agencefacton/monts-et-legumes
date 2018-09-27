class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.all
    @products = Product.all
  end

  def new
    @sale = Sale.new
    @products = Product.all
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to sales_path
    else
      render :new
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
