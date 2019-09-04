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


end
