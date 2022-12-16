class Admins::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
