class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @orders = @user.orders
  end
end
