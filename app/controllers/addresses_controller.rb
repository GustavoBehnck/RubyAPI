class AddressesController < ApplicationController
    before_action :set_contact

    def show
        render json: @contact.address
    end

    def update
        if @contact.address.update(address_params)
            render json: @contact.address
        else
            render json @contact.errors
        end
    end

    private
        def set_contact
            @contact = params[:contact_id] ? Contact.find(params[:contact_id]) : { 'error': 'You didnt inform an id'}
        end

        def address_params
            ActiveModelSerializers::Deserialization.jsonapi_parse(params)
        end
end
