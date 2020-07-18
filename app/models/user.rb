class User < ApplicationRecord
    has_many :cards
    has_many :traders, foreign_key: :trader_id, class_name: "Trade"
    has_many :tradees, foreign_key: :tradee_id, class_name: "Trade"

    has_secure_password
    validates :email, :username, :first_name, :last_name, presence: true    
    validates :email, :username, uniqueness: true

end
