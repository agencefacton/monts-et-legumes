module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy, :toggle_active]

    def index
      @products = Product.order(active: :desc)
      @categories = Category.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to admin_products_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def toggle_active
      @product.active = !@product.active
      @product.save
      redirect_to admin_products_path
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :unit, :category_id, :description, :active, :photo)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
