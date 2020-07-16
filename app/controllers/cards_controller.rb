class CardsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    # ^ Do not require login for index because we want to display all cards on homepage


    def index 
        cards = Card.all.map do |card|
            {
                card:CardSerializer.new(card),
                user:{
                    user_id: card.user.id,
                    username: card.user.username
                }                
        }
        end
        render json: {cards: cards}
    end

    def create 
        card = @user.cards.create(cards_params)
        render json: card
    end


    private

    def cards_params
        params.require(:card).permit(:category, :first_name, :last_name, :team, :condition, :year)
    end

end
