class Transaction < ActiveRecord::Base
    validates :type, coin_name:, api_user:, presence: true
end
