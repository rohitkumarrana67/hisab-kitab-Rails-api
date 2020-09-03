class CustomersController < ApplicationController
  before_action :auth_and_get_user, only: [:create,:index]
  
  def index 
    return render json: @user
    customers=Customer.all 
    render json: customers
  end

  def create
  end

end
