class ApplicationController < ActionController::API
    before_action :ensure_json_request

    def ensure_json_request
        unless request.headers['Accept'] =~ /vnd\.api\+json/
            render json:{error: 'Invalid headers - Use on your headers Accept: application/vnd.api+json'}, :status => 406
            return 
        end
    end

end
