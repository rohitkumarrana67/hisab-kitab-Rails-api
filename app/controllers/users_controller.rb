class UsersController < ApplicationController

    def create
      user=User.create(
        username:params[:username],  
        email:params[:email],
        password:params[:password]
        )
      token=generate_token({user_id:user.id})
      user.token=token
      if user.save
        render json: user , status: :created
      end
    end
    
end
