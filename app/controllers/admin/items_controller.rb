class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to '/admin/items'
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :introduction, :name, :price, :is_active, :image)
  end
end
