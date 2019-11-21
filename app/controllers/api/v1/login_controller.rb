class Api::V1::LoginController < ApplicationController

    # def create
    #     user = User.find_by("lower(username) = ?", params[:username].downcase)
    #     if user && user.authenticate(params[:password])
    #       render json: { token: create_token(user.id), user_id: user.id }
    #     else
    #       render json: { errors: [ "user not found" ] }, status: :unprocessable_entity
    #     end 
    #   end

      def login 
        user = User.find_by(username: params[:username])
        is_authenticated = user.authenticate(params[:password])
        # byebug

        if is_authenticated
          # token = JWT.encode({ user_id: user.id }, "signingsecretsigningsecretsigningsecret", 'HS256')
          generated_token = create_token(user.id)
          render json: {token: generated_token, user_id: user.id}
        else 
          render json: {errors: ["try again"]}, status: 422
      end 
    end 

end 
