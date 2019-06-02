module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :orderindex, :new_order]

    def index
      @users = User.all.order(:created_at)
    end

    def show
      @transaction = Transaction.new
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :mayeres, :admin, :tab, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
  end
end
