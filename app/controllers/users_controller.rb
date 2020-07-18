class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
   
    def create
      user = User.create(user_params)
     
      if user.valid?
        # user created succesfully, send token 
        token = encode_token({ user_id: user.id })
        render json: { user: UserSerializer.new(user), status: :created, jwt: token }
      else
        render json: { error: user.errors.full_messages, status: :not_acceptable}
      end
    end

    def index
      pp @user
      render json: @user
    end
  

  private
    
    def user_params
      params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
    end

end
