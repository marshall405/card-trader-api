class CardsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    # ^ Do not require login for index because we want to display all cards on homepage

    wrap_parameters :card, include:[:category, :first_name, :last_name, :team, :condition, :year, :image]


    def index 
        cards = Card.all.map do |card|
            {
                info:CardSerializer.new(card),
                user:{
                    user_id: card.user.id,
                    username: card.user.username
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
        card = @user.cards.create(first_name: params[:first_name], last_name: params[:last_name], team: params[:team], condition: params[:condition], year: params[:year], category: params[:category])
        card.card_image.attach(params[:image])
        card.img_url = polymorphic_url(card.card_image)

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
   


    private

    def cards_params
        params.require(:card).permit(:category, :first_name, :last_name, :team, :condition, :year, :image)
    end

end
