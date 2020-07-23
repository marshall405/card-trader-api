class TradesController < ApplicationController
    

    def index
        traders = @user.traders.map do |trade|
            TradeSerializer.new(trade)
        end

        tradees = @user.tradees.map do |trade|
            TradeSerializer.new(trade)
        end

        render json: {
            traders: traders
        }
    end

    def offers 
        tradees = @user.tradees.map do |trade|
            TradeSerializer.new(trade)
        end
        render json: {
            tradees: tradees
        }
    end

    def show 
        trade = Trade.find(params[:id])
        render json: trade
    end

    def create
        pp params
        requested_card = Card.find(trade_params[:card_id])
        trade = @user.traders.create(tradee_id: requested_card.user.id, requested_card_id: requested_card.id) 
        params[:cards].each do |c|
            card = Card.find(c)
            if !card.trade_id
                if !card.update(trade_id: trade.id)
                    render json: {
                        message: card.errors
                    }
                    return
                end
            end
        end
        render json: {
            trade: trade, 
            cards: trade.cards,
            message: 'created new trade'
        }
    end

    def destroy
        trade = Trade.find(params[:id])
        trade.cancel
        render json: trade
    end

    def update_offer
        trade = Trade.find(params[:id])

        # confirm that the tradee is the user sending their status
        if @user.id == trade.tradee.id
            trade.update(status: params[:status])
            trade.clear 
            render json: trade, status: :accepted
        else
            render json: trade, status: :unauthorized
        end
        
    end


    private

    def trade_params
        params.permit(:card_id, :cards)
    end


end
