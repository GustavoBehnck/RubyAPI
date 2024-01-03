class AuthsController < ApplicationController
    def create
        hmac_secret = 'my$cretK3y'
        payload = { name: params[:name], exp: Time.now.to_i + 120 }
        
        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: {'token': token}
    end
end
