class Admins::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @user = @order.user
    @cart_items = @order.cart_items
  end
end
