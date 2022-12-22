class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  #成功した時
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = 'successfully'
      redirect_to admin_customer_path(@customer.id)
  #失敗した時
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana,
                                      :postal_code, :address, :telephone_number, :is_deleted, :created_at, :updated_at)
  end
end
