class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.new(cart_item_params)
  end

  def update
  end

  def destroy
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
