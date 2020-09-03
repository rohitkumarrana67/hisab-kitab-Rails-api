class ApplicationController < ActionController::API
  
  def auth_and_get_user
    authorization_header=request.headers[:authorization]
    if !authorization_header
      return render json: {error:"not authorized"}, status: :unauthorized
    else 
      encoded_token=authorization_header.split(" ")[1];
      secret_key=Rails.application.secrets.secret_key_base[0]
      decoded_token=JWT.decode(encoded_token,secret_key)
      @user=User.find(decoded_token[0]["user_id"])
    end 
  end


end
