class TradesController < ApplicationController


    def create
        requested_card = Card.find(trade_params[:card_id])
        trade = @user.traders.create(tradee_id: requested_card.user.id, requested_card_id: requested_card.id) 
        params[:cards].each do |c|
            card = Card.find(c["card_id"])
            if !card.trade_id
                card.update(trade_id: trade.id)
            else
                raise 'Card being offered in trade is already being used in another trade'
            end
        end
        render json: {
            trade: trade, 
            cards: trade.cards,
            message: 'created new trade'
        }
    end


    private

    def trade_params
        params.permit(:card_id, :cards)
    end


end
