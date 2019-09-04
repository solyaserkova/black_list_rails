class BlackListController < ApplicationController
  def index
    @customers = Customer.where(blacklist: true)
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.update(blacklist: false)
    @customers = Customer.where(blacklist: true)
    render 'index'
  end


  def create
    @customer = Customer.where(phone: params[:phone])
    if @customer
      @customer.update(blacklist: true)
    end
    @customers = Customer.where(blacklist: true)
    render 'index'

  end

end
