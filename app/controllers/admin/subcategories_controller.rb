module Admin
  class SubcategoriesController < Admin::ApplicationController
    before_action :set_subcategory, only: [:edit, :update, :destroy]

    def index
      @categories = Category.order(id: :asc)
      @subcategory = Subcategory.new
    end

    def create
      @subcategory = Subcategory.new(subcategory_params)
      if @subcategory.save
        redirect_to admin_subcategories_path
      else
        render :index
      end
    end

    def edit
      @category = @subcategory.category
    end

    def update
      if @subcategory.update(subcategory_params)
        redirect_to admin_subcategories_path
      else
        render :edit
      end
    end

    def destroy
      @subcategory.destroy
      redirect_to admin_subcategories_path
    end

    private

    def subcategory_params
      params.require(:subcategory).permit(:name, :order, :category_id)
    end

    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end
  end
end
