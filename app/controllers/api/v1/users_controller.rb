class Api::V1::UsersController < ApplicationController


    def profile
      # debugger
      # token = request.headers["Authorization"].split(" ")[1]
      # decoded_token = JWT.decode(token, "signingsecretsigningsecretsigningsecret", true, { algorithm: 'HS256' })
      # decode = decoded_token
      # user_id = decoded_token[0]["user_id"]
      found = current_user
      render json: found
    end  

    def index 
        @users = User.all
        render json: {user: @users} 
    end 

    def show 
        # @user = User.find(params[:id])
        # render json: { user: UserSerializer.new(@user) }

        user_id = params[:id]
        if user_id_from_token == user_id.to_i
          user = User.find(user_id)
          render json: user, include: :answers
        else
          render json: { go_away: true }, status: :unauthorized
        end
      end 

    def create
      # debugger
        user = User.create(user_params)
        if user.valid?
          # token = JWT.encode({ user_id: @user.id }, "signingsecretsigningsecretsigningsecret", 'HS256')
          render json: {token: create_token(user.id), user_id: user.id}
          # render json: { user: UserSerializer.new(@user) }, status: :created
        else
          # render json: { error: 'failed to create user' }, status: :not_acceptable
          render json: {errors: user.errors.full_messages}, status: 422
        end
      end
     
      private
      def user_params
        params.permit(:username, :password) #initially had require(:user)
      end

      


    

end
