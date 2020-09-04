class AuthenticationController < ApplicationController

  def login
    user=User.find_by(username: params[:username])

    if !user
      return render json: {error:"invalid credentials"} , status: :unauthorized
    end

    if user.authenticate(params[:password])
      data={user_id:user.id}
      token=generate_token(data)
      user.token=token
      user.save
      render json: user, status: :ok
    else
      render json: {error:"invalid credentials"} , status: :unauthorized
    end  
  end

end
