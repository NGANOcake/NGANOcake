class Admins::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  admins_item_path(@item.id)
    else
      render :index
    end
  end

  def show
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
