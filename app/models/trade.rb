class Trade < ApplicationRecord
    belongs_to :trader, class_name: "User"
    belongs_to :tradee, class_name: "User"
    belongs_to :requested_card, class_name: "Card"
    has_many :cards
end
