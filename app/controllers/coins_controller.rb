class CoinsController < ApplicationController


    ## Catch All
    def index
        render json: {route: "no matching routes"}
    end


    def all
        render json: Coin.all()
    end


    def show_one
        ##find coin
        this_coin = Coin.find_by(id: params[:id])
            
        render json: this_coin
    end


    def create

        # if errors?
        #     flash[:error] = "You have errors"

        #     render json: flash
        # else
            ##create coin
            Coin.create( name: params[:name], unit_value: params[:unit_value])

            render json: Coin.last()
        end
    end


    def update
        ##find coin
        this_coin = Coin.find_by(id: params[:id])

        ##update coin
        this_coin.update(
            name: params[:name], 
            unit_value: params[:unit_value],
            count: params[:count]
            )

        render json: this_coin
    end


    def destroy
        ##delete coin
        deleted_coin = Coin.find_by(id: params[:id]).destroy
        ##build object
        context = {message: "Coin deleted properly", deleted_coin: deleted_coin}
        
        render json: context
    end


    def total
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "total"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "total"}
    end




end
