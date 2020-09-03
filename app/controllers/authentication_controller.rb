class AuthenticationController < ApplicationController

  def login
    user=User.find_by(username: params[:username])

    if !user
      return render json: {error:"invalid credentials"} , status: :unauthorized
    end

    if user.authenticate(params[:password])
      secret_key=Rails.application.secrets.secret_key_base[0]
      token=JWT.encode({user_id:user.id},secret_key)  
      render json: {token:token} , status: :ok
    else
      render json: {error:"invalid credentials"} , status: :unauthorized
    end  
  end


end
