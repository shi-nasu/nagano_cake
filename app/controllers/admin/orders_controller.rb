class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  private

  # def order_params
  #   params.require(:order).permit(:id, :payment)
  # end
end
