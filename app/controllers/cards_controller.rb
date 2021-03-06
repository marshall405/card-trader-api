class CardsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    # ^ Do not require login for index because we want to display all cards on homepage

    wrap_parameters :card, include:[:title, :category, :first_name, :last_name, :team, :condition, :year, :image]


    def index 
        cards = Card.all.map do |card|
            pending = card.requested_trades.filter do |trade|
                trade.status === "pending"
            end
            {
                info:CardSerializer.new(card),
                user:{
                    user_id: card.user.id,
                    username: card.user.username
                },
                trades:{
                    requested_trades: pending.count
                }    
        }
        end
        render json: cards
    end

    def show
        card = Card.find(params[:id])
        render json: {
            card: card,
            user: {
                user_id: card.user.id,
                username: card.user.username
            }
        }   
    end
    def create 
        
        pp params
        card = @user.cards.create(title: params[:title],first_name: params[:first_name], last_name: params[:last_name], team: params[:team], condition: params[:condition], year: params[:year], category: params[:category])
        card.card_image.attach(params[:image])

        card.img_url = polymorphic_url card.card_image

        if card.valid?
            card.save
            render json: card
        else
            render json: {
                message: card.errors
            }
        end

    end

    def update
        card = Card.find(params[:id])
        if card 
            card.update(cards_params)
            render json: card
        else
            render json: {message: "Could not update card"}
        end
        
    end

    def user_cards
        cards = @user.cards
        render json: cards
    end
   
    def destroy
        card = Card.find(params[:id])
        if card.user.id === @user.id 
            if card.trade
                card.trade.update(status: "cancelled")
            end
            card.destroy
            render json: {message: "card deleted"}
        else
            render json: {message: "not authorized"}, status: :unauthorized
        end

    end


    private

    def cards_params
        params.require(:card).permit(:title, :category, :first_name, :last_name, :team, :condition, :year, :image)
    end

end
