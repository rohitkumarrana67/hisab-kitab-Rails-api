class UsersController < ApplicationController

    def create
      user=User.create(
        username:params[:username],  
        email:params[:email],
        password:params[:password]
        )
      render json: user , status: :created
    end
end
