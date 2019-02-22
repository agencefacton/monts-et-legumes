class CustomerOrdersController < ApplicationController

  def index
    @years = Order.where(status: 1).group(:year_number).count
  end

  def show
    @year = params[:year_number]
    @weeks = Order.where(status: 1, year_number: @year).group(:week_number).count
    @category = Category.all
    @cayear = Order.where(status: 1, year_number: @year).sum(:total_price)
    end

  def week
    @year = params[:year_number]
    @week = params[:week_number]
    @category = Category.all
    @orders = Order.where(status: 1, year_number: @year, week_number: @week).joins(:user)
    @caweek = Order.where(status: 1, year_number: @year, week_number: @week).sum(:total_price)
  end
end
