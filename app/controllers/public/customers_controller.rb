class Public::CustomersController < ApplicationController
  def status
  end

  def new
    @customers = Cust.new
  end

  def show
    @customer = current_customer
  end

  def edit
  end

  def unsubscribe
    @customer = current_customer
  end

end
