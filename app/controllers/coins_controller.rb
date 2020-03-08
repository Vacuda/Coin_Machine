class CoinsController < ApplicationController


    ## Catch All
    def index
        render json: {route: "no matching routes"}
    end


    def all
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "all"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "all"}
    end

    def show_one
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "show_one"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "show_one"}
    end

    def create
        
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "create"
        puts "~~~~~~~~~~~~~~~~~~~~"

        Coin.create( name: params[:name], unit_value: params[:unit_value])

        render json: Coin.last()
    end

    def update
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "update"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "update"}
    end

    def destroy
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "destroy"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "destroy"}
    end

    def total
        puts "~~~~~~~~~~~~~~~~~~~~"
        puts "total"
        puts "~~~~~~~~~~~~~~~~~~~~"
        render json: {route: "total"}
    end




end
