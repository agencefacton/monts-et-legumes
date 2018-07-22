class ProductOrdersController < ApplicationController
before_action :set_product_order, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @product_orders = policy_scope(ProductOrder)
  end

  def new
    @product_order = ProductOrder.new
    authorize @product_order
  end

  def create
    @product_order = current_user.product_orders.build(product_order_params)
    authorize @product_order
  end

  def edit
  end

  def update
  end

  private

  def product_order_params
    params.require(:product_order).permit(:quantity, :product_id)
  end

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
    authorize @product_order
  end
end
