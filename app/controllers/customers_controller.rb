class CustomersController < ApplicationController

  def index
    @customers = Customer.where(blacklist: false)
  end

  def show
    @customer = Customer.where(id: params[:id]).first
    if @customer
      render :show
    else
      render plain: "Page not found", status: 404
    end
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render "new"
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    @customers = Customer.all
    redirect_to action: :index
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :phone, :description, :blacklist)
  end
end


