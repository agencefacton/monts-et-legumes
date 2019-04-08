class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy, :change_active]

  def index
    if current_user.admin?
      @products = Product.order(active: :desc)
    else
      @products = Product.where(active: true)
    end
    @product_orders = current_order.product_orders
    @order = current_order
    @product = Product.new
    @categories = Category.all
    @post = Post.last
  end

  def show
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :index
    end
  end

  def change_active
    @product.active = !@product.active
    @product.save
    redirect_to products_path
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :unit, :category_id, :description, :active, :photo)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
