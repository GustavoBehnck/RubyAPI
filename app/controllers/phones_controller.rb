class PhonesController < ApplicationController
    before_action :set_contact

    def show
        render json: @contact.phones
    end

    def destroy
        phone = Phone.find(phone_params[:id])
        if phone.destroy 
            render json: { "success": "Phone Deleted" }
        else
            render json: { "error": "Something went wrong" }
        end
    end
    
    def update
        phone = Phone.find(phone_params[:id])
        if phone.update(phone_params)
            render json: @contact.phones
        else
            render json: @contact.errors
        end
    end

    def create
        @contact.phones << Phone.new(phone_params)
        if @contact.save 
            render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
        else
            render json @contact.errors
        end
    end


    private
    # Use callbacks to share common setup or constraints between actions.
        def set_contact
            @contact = params[:contact_id] ? Contact.find(params[:contact_id]) : { 'error': 'You didnt inform an id'}
        end

        def phone_params
            ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        end
end