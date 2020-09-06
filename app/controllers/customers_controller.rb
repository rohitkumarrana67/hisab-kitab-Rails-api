class CustomersController < ApplicationController
  before_action :auth_and_get_user, only: [:create, :index, :update, :destroy, :show]
  before_action :get_customer, except: [:index, :create]
  
  def index 
    customers=Customer.all 
    render json: customers
  end

  def create
    customer = Customer.create( 
      user_id:@user.id,
      name:params[:name],
      email:params[:email],
      mob:params[:mob],
      address:params[:address]
    )
    if customer.save
      render json: customer , status: :created
    end
  end

  def show
    render json: @customer
  end

  def update 
    if @customer
      @customer.update(params.require(:customer).permit(:name, :email, :mob ,:address))
      render json: @customer
    else
      format.json { render json:"User not found" }
    end
  end

  def destroy
    @customer.destroy
  end

  private

  def get_customer
    @customer = Customer.find(params[:id])
  end

end
