class CardSerializer < ActiveModel::Serializer
    attributes :category, :id, :first_name, :last_name, :team, :year, :condition, :trade_id, :img_url


  end