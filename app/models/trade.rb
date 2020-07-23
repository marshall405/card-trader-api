class Trade < ApplicationRecord
    belongs_to :trader, class_name: "User"
    belongs_to :tradee, class_name: "User"
    belongs_to :requested_card, class_name: "Card"
    has_many :cards


    def cancel 
        self.update(status: "cancelled")
        self.cards.each do |card|
            card.update(trade_id: nil)
        end
    end


    def clear
        if self.status === "accepted"
            self.cards.each do |card|
                card.destroy
            end
            self.requested_card.destroy
        else
            self.cards.each do |card|
                card.update(trade_id: nil)
            end
        end
    end

end
