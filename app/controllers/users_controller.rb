class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :orderindex]

  def show
  end

  def index
    @users = User.order(:first_name).all
    @orders = @users.orders
  end

  def orderindex
    @orders = Order.where(user: @user).where("total_price > ?", 0)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :mayeres, :admin, :tab, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
