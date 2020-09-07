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
    
    def index
      @users=User.all
      render json:@users
    end

    def show
      @user=User.find(params[:id])
      if @user
        render json:@user
      else
        format.json { render json:"User not found" }
      end
    end

    def update
      @user = User.find(params[:id])
     
      if @user.update(user_params)
        render json:@user
      else
        format.json { render json:"User not found" }
      end
    end
    
    def destroy
      @user=User.find(params[:id])
      @user.destroy
    end
    private
    def user_params
      params.require(:user).permit(:username, :email)
    end
end
