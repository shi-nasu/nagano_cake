class Public::CustomersController < ApplicationController
  def status
  end

  def new
    @customers = Cust.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
