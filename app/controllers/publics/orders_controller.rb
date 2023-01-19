class Publics::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:select_address] == "1"
      @order.postal_code = current_user.postal_code
      @order.name = current_user.first_name + current_user.last_name
      @order.address = current_user.address
    elsif params[:select_address] == "2"
    else
      render :new
    end
    @cart_items = current_user.cart_items.all
    @total = @cart_items.inject(0){ |sum, item| sum + item.sum_price }
  end

  def thanks
  end

  def create
    cart_items = current_user.cart_items.all
    @order = current_user.orders.new(create_params)
    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.price = cart.item.price
        order_detail.save
      end
      redirect_to  thanks_publics_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end

  end

  def index
    @orders = current_user.orders
  end

  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

private
  def order_params
    params.permit(:payment_method, :postal_code, :address, :name)
  end

  def create_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment)
  end

  def address_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method)
  end
end
