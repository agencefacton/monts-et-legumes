module Admin
  class TransactionsController < ApplicationController
    before_action :set_transaction, only: [:destroy]
    before_action :set_user, only: [:create, :destroy]

    def create
      @transaction = Transaction.new(transaction_params)

      if @transaction.save
        if @transaction.add == true
          @user.tab += @transaction.amount
          @user.save
        else
          @user.tab -= @transaction.amount
          @user.save
        end
        redirect_to admin_user_path(@user)
      else
        render :new
      end
    end

    def destroy
      if @transaction.add == true
        @user.tab -= @transaction.amount
        @user.save
      else
        @user.tab += @transaction.amount
        @user.save
      end
      @transaction.destroy
      redirect_to admin_user_path(@user)
    end

    private

    def transaction_params
      params.require(:transaction).permit(:add, :user_id, :amount)
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
