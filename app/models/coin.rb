

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

        #setup array
        low_coin_array = []

        #loop through, check if inventory is low
        all_coins.each do |coin|
            if coin.count < 4
                low_coin_array.push(
                    "#{coin.name.capitalize()} - (#{coin.count} coins) - Please Deposit More"
                )
            end
        end

        # Tell the UserMailer to send the email
        # ApplicationMailer.coin_low.deliver_later
        # Didn't get MailGun to work properly.  I refactored to send this info via json

        if low_coin_array.length != 0
            return {
                low_coins: low_coin_array,
                email_to: Admin.all_emails()
            }
        else
            return "Coin Levels Safe."
        end

    end





end



