class PhonesController < ApplicationController
    before_action :set_contact

    def show
        render json: @contact.phones
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
        @contact = params[:contact_id] ? Contact.find(params[:contact_id]) : { 'error': 'You didnt inform an id'}
    end
end