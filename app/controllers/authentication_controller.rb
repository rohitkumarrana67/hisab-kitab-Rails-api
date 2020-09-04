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
      if user.save
        render json: {token:token}, status: :ok
      end
    else
      render json: {error:"invalid credentials"} , status: :unauthorized
    end  
  end

end
