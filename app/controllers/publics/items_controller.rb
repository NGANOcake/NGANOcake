class Publics::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.page(params[:page])
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem
  end

  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image_id)
  end
end
