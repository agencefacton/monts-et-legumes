class UsersController < ApplicationController
before_action :set_user, only: [:create, :show]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
