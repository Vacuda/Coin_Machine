class Key < ActiveRecord::Base
    validates :api_key, presence: true, uniqueness: true
end
