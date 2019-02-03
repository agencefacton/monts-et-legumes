class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:destroy]
  before_action :set_user, only: [:create, :destroy, :index]

  def new
    @transaction = Transaction.new
  end

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
      redirect_to transactions_path(@user)
    else
      render :index
    end
  end

  def index
    @transaction = Transaction.new
    @transactions = Transaction.where(user_id: @user.id).order(created_at: :desc)
  end

  def destroy
    @transaction.destroy
    redirect_to transaction_path(@user)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:add, :user_id, :amount)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
