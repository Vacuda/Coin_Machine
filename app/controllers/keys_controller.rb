require 'securerandom'

class KeysController < ApplicationController

    def all
        render json: Key.all()
    end


    def create
        ##generate api_key and save in db
        new_api_key = SecureRandom.hex(10)
        Key.create(api_key: new_api_key)

        render json: Key.last()
    end


    def destroy
        ##delete key
        deleted_key = Key.find_by(id: params[:id]).destroy
        
        ##build response
        context = {
            message: "Key deleted properly", deleted_key: deleted_key
        }
        
        render json: context
    end

end
