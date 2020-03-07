class Coin < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :unit_value, presence: true, numericality: true
end



# number_with_precision(555.5, precision: 2)