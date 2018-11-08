class CustomerOrdersController < ApplicationController

  def index
    @orders = Order.where("status = ?", 1).group(:week_number).count
  end

  def show
    @orders = Order.where(status: 1, week_number: params[:week_number]).joins(:user)
    @week = params[:week_number]
  end
end
