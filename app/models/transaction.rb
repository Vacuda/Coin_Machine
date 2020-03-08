class Transaction < ActiveRecord::Base
    validates :trans_type, :coin_name, :api_user, presence: true
end
