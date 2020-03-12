require 'action_view'
include ActionView::Helpers::NumberHelper


class CoinsController < ApplicationController


    ## Catch All
    def index
        render json: {route: "no matching routes"}
    end


    def all
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        render json: Coin.all()
    end


    def show_one
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        ##find coin
        this_coin = Coin.find_by(id: params[:id])
            
        render json: this_coin
    end


    def create
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

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
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        ##find coin
        this_coin = Coin.find_by(id: params[:id])

        ##update coin
        this_coin.update(
            name: params[:name], 
            unit_value: params[:unit_value],
            count: params[:count]
            )

        ##build response
        context = {
            message: "Coin updated properly", updated_coin: this_coin
        }

        render json: context
    end


    def destroy
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

        ##delete coin
        deleted_coin = Coin.find_by(id: params[:id]).destroy

        ##build response
        context = {
            message: "Coin deleted properly", deleted_coin: deleted_coin
        }
        
        render json: context
    end


    def total
        ##-----------------------api check---------------------------
        if Key.where(api_key: params[:api_key]).none?
            render json: {message: "api_key is not valid"} and return
        end
        ##-----------------------------------------------------------

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
