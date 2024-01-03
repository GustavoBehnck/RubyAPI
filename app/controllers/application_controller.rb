class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :ensure_json_request
    before_action :authenticate

    hmac_secret = 'my$cretK3y'

    def ensure_json_request
        unless request.headers['Accept'] =~ /vnd\.api\+json/
            render json:{error: 'Invalid headers - Use on your headers Accept: application/vnd.api+json'}, :status => 406
            return 
        end
    end

    def authenticate
        authenticate_or_request_with_http_token do |token, options|
            hmac_secret = 'my$cretK3y'
            JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
        end
    end
end
