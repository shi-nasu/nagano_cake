class Public::OrdersController < ApplicationController

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    if params[:order][:address_select] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:order][:address_select] == "1"
      @address = Postal.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_select] == "2"
    end

    @total = 0
  end

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @orders = current_customer.orders.all
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order.order_details.create!(
          item_id:cart_item.item_id,
          price:300,#:cart_item.price/cart_item.amount,
          amount:cart_item.amount,
          making_status:"0")
      end
      current_customer.cart_items.destroy_all
    end
    redirect_to "/orders/thanks"
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :shipping_cost)
  end
end
