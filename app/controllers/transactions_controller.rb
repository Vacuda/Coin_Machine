require 'coins_controller'

class TransactionsController < ApplicationController


    def all
        render json: Transaction.all()
    end


    def all_for_api
        ##get api key
        api_key = params[:api_user]

        render json: Transaction.where(api_user: api_key)
    end


    def create
        ##create new transaction
        new_transaction = Transaction.create(
            trans_type:     params[:trans_type],
            coin_name:      params[:coin_name],
            api_user:       params[:api_user]
        )

        ##find coin
        this_coin = Coin.find_by(
            name: new_transaction.coin_name
        )

        ##add/remove coin
        if new_transaction.trans_type == "withdrawal"
            this_coin.count = this_coin.count - 1
            this_coin.save()
        end
        if new_transaction.trans_type == "deposit"
            this_coin.count = this_coin.count + 1
            this_coin.save()
        end

        #check coin levels
        Coin.coin_level_check()

        ##build response
        context = {
            message: "Transaction created successfully",
            new_transaction: new_transaction
        }

        render json: context


    end












end
