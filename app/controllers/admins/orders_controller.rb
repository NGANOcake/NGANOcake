class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])

  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.user.orders
  end
end
