class CustomerOrdersController < ApplicationController

  def index
    @years = Order.where(status: 1).group(:year_number).count
  end

  def show
    @weeks = Order.where(status: 1, year_number: params[:year_number]).group(:week_number).count
    @year = params[:year_number]
    @category = Category.all
    @cayear = Order.where(status: 1, year_number: params[:year_number]).sum(:total_price)
  end

  def week
    @year = params[:year_number]
    @week = params[:week_number]
    @orders = Order.where(status: 1, year_number: @year, week_number: @week).joins(:user)
  end
end
