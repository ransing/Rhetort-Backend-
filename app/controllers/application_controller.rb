class ApplicationController < ActionController::API

    private
    
    
    # def token
    #   # debugger
    #   request.headers["Authorization"].split(" ")[1]
    # end
    
    def decoded_token
      begin
        token = request.headers["Authorization"].split(" ")[1]
        JWT.decode(token, "signingsecretsigningsecretsigningsecret", true, { algorithm: 'HS256' })
      rescue
        return nil
      end
      # byebug
    end
    
    def create_token(user_id)
      payload = { user_id: user_id}
      JWT.encode(payload, "signingsecretsigningsecretsigningsecret", 'HS256') 
      # byebug
    end

    def current_user
      # decode = decoded_token
      if decoded_token != nil
        User.find(decoded_token[0]["user_id"])
      end

      # byebug
    end 


    # def create_token(user_id)
    #   JWT.encode({ user_id: user.id }, signing_secret, 'HS256') 
    # end
  
    # def user_id_from_token
    #   begin
    #     token = request.headers["Authorization"]
    #     decoded_token = JWT.decode(token, signing_secret, true, { algorithm: 'HS256' })
    #     return decoded_token.first["user_id"]
    #   rescue 
    #     return nil
    #   end
    # end
  
    def token_is_valid
      current_user != nil
    end
  
    def signing_secret
      ENV["JWT_SECRET_KEY"]
    end

end
