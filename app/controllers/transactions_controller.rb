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
        #check if transaction can occur
        if params[:trans_type] == "withdrawal"
            #find coin
            possible_withdrawn_coin = Coin.find_by(
                name: params[:coin_name]
            )

            ##if coin isn't there to withdraw, return message without withdrawing
            if possible_withdrawn_coin.count <= 0
                ##build response
                context = {
                    message: "Unable to withdraw coin.  Insufficient funds",
                    coin_name: possible_withdrawn_coin.name
                }

                render json: context and return


            end
        end
        
        
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

            #check coin levels after a withdrawal
            Coin.coin_level_check()

        end
        if new_transaction.trans_type == "deposit"
            this_coin.count = this_coin.count + 1
            this_coin.save()
        end

        ##build response
        context = {
            message: "Transaction created successfully",
            new_transaction: new_transaction
        }

        render json: context


    end












end
