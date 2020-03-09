

class Coin < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :unit_value, presence: true, numericality: true

    ##getter
    def total_value
        #calculate total value
        output = self.count * self.unit_value

        return output
    end


    def self.coin_level_check
        #get all coins
        all_coins = Coin.all()

        #loop through, check if inventory is low
        all_coins.each do |coin|
            if coin.count < 4
                puts "send email to:"

            
                # Tell the UserMailer to send the email
                ApplicationMailer.coin_low.deliver_now
                #     format.json { render json: "xxx", status: :created, location: "xxx" }
                # else
                #     format.json { render json: "yyy", status: :unprocessable_entity }



                # ApplicationMailer.coin_low(all_emails)

                puts "!!!!!!!!!!!!!!!"
                break
            end
        end


    end





end



