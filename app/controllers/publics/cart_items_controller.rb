class Publics::CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def update
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to publics_cart_items_path
  end

  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to publics_cart_items_path
  end

  def destroy_all
    @cart_items = current_user.cart_items.all
    @cart_items.destroy_all
    redirect_to publics_cart_items_path
  end

  def create
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
