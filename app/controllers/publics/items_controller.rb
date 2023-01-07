class Publics::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new(cart_item_params)
   @item = Item.find_by(id:@cart_item.item_id)
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
