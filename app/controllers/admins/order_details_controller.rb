class Admins::OrderDetailsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @user = @order.user
  end
end
