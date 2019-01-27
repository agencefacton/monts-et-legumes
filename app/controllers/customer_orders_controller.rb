class CustomerOrdersController < ApplicationController

  def index
    @orders = Order.where("status = ?", 1).group(:year_number).count
    @years = Order.where(status: 1).group(:year_number).count
  end

  def show
    @weeks = Order.where(status: 1, year_number: params[:year_number]).group(:week_number).count
    @year = params[:year_number]
  end

  def week
    @orders = Order.where(status: 1, week_number: params[:week_number]).joins(:user)
    @year = params[:year_number]
    @week = params[:week_number]
  end
end
