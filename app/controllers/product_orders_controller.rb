class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:update, :destroy]
  before_action :set_order, only: [:create, :destroy, :update]

  def index
    @orders = Order.where("status = ?", 1).group(:week_number).count
    @quantities = ProductOrder.joins(:product, :order).where("status = ?", 1).group(:week_number, :name).sum(:quantity)
      respond_to do |format|
      format.html
      format.xlsx
    end
    @years = Order.group(:year_number).count
  end

  def show
    @year = params[:year_number].to_i
    @weeks = Order.where(year_number: 2019)
  end

  def week
    @week = params[:week_number].to_i
    @quantities = ProductOrder.joins(:product, :order).where("status = ?", 1).where("year_number = 2019").where("week_number = 3").group(:product).sum(:quantity)
    @quantities2 = ProductOrder.joins(:product, :order).where("status = ?", 1).where("week_number = ?", params[:week_number])
    @quantities3 = ProductOrder.joins(:product, :order).where("status = ?", 1).where("week_number = ?", params[:week_number]).group(:name)
  end

  def create
    save_order unless @order.persisted?
    if product_order_params[:quantity].to_i > 0
      @product_order = @order.product_orders.create(product_order_params)
    end
    session[:order_id] = @order.id
    if @product_order.save
      redirect_to products_path
    else
      render 'products/index'
    end
  end

  def destroy
    @product_order.destroy
    redirect_to products_path
  end

  def update
    if product_order_params[:quantity].to_i == 0
      @product_order.destroy
    else
      @product_order.update(product_order_params)
    end
    redirect_to products_path
  end



  private

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id)
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
