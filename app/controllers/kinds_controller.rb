class KindsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_kind, only: %i[ show update destroy ]
  before_action :authenticate
  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      #! pode vir pela rota /contact/:contact_id/kind ou pelo /kinds/:id
      @kind = Kind.find(params[:contact_id] ? Contact.find(params[:contact_id]).kind_id : params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      params.require(:kind).permit(:description)
    end

    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        hmac_secret = 'my$cretK3y'
        #ActiveSupport::SecurityUtils.secure_compare(
        #  ::Digest::SHA256.hexdigest(token),
        #  ::Digest::SHA256.hexdigest(TOKEN)
        #)
        JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
      end
    end
end 
