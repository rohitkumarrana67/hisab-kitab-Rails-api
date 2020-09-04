class ApplicationController < ActionController::API
  
  
  def generate_token(data)
    iat = Time.now.to_i
    secret_key=Rails.application.secrets.secret_key_base[0]
    jti_raw = [secret_key, iat].join(':').to_s
    jti = Digest::MD5.hexdigest(jti_raw)
    jti_payload = { :data => data, :iat => iat, :jti => jti }
    token=JWT.encode(jti_payload,secret_key)  
  end

  def decode_token(encoded_token)
    secret_key=Rails.application.secrets.secret_key_base[0]
    decoded_token = JWT.decode encoded_token, secret_key
  end

  def auth_and_get_user
    authorization_header=request.headers[:authorization]
    if !authorization_header
      return render json: {error:"not authorized"}, status: :unauthorized
    else 
      encoded_token=authorization_header.split(" ")[1];
      decoded_token=decode_token encoded_token
      user_id=decoded_token[0]["data"]["user_id"]
      @user=User.find_by(id:user_id,token:encoded_token)
      return render json: @user
    end 
  end


end
