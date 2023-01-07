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
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id =current_user.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to publics_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
