class Admins::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @user = @order.user
    @order_details = @order.order_details
  end
end
