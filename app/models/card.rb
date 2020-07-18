class Card < ApplicationRecord
    belongs_to :user

    # Can only be offered in one trade at a time
    belongs_to :trade, optional: true

    # Can be the requested card in many trades
    has_many :requested_trades, foreign_key: :requested_card_id, class_name: "Trade"
end
