class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:create, :update, :destroy, :index]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to transactions_path(@user)
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def index
    @transaction = Transaction.new
    @transactions = Transaction.where(user_id: @user.id)
  end

  def destroy
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
