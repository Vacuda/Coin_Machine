require 'action_view'
include ActionView::Helpers::NumberHelper


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
        ##number format to two decimals
        value = number_with_precision(params[:unit_value], precision: 2)

        ##create coin
        Coin.create(
            name: params[:name],
            unit_value: value,
            count: 0
        )

        render json: Coin.last()
        
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
        
        ##build response
        context = {
            message: "Coin deleted properly", deleted_coin: deleted_coin
        }
        
        render json: context
    end


    def total
        ##get all coins in system
        all_coins = Coin.all()

        ##loop through to sum up total values of each coin
        value_all_coins = 0
        all_coins.each do |coin|
            value_all_coins += coin.total_value
        end

        ##make pretty
        value_all_coins = "$" + value_all_coins.to_s

        ##build response
        context = {
            value_all_coins: value_all_coins
        }

        render json: context
    end




end
