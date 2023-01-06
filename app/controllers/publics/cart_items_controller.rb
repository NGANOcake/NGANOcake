class Publics::CartItemsController < ApplicationController
  def index
    @cart_items = current_user.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
