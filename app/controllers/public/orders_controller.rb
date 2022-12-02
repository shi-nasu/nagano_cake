class Public::OrdersController < ApplicationController

  def confirm
    @orders = current_customer.cart_items.all
  end

  def index
    @orders = current_orders.cart_items.all
  end

  def new
    @order = Order.new
  end

  def show
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to "/orders/confirm"
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end
end
