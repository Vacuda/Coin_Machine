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
        puts "Coin Level Check"
    end





end



# number_with_precision(555.5, precision: 2)