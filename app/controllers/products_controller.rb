class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    @product_order = current_order.product_orders.new
  end

  def show
  end

  def new
    @product = Product.new
    # authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.save
    # authorize @product
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :unit, :category, :description, :active)
  end

  def set_product
    @product = Product.find(params[:id])
    # authorize @product
  end

end
