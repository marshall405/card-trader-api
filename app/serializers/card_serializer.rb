class CardSerializer < ActiveModel::Serializer
    attributes :title, :category, :id, :first_name, :last_name, :team, :year, :condition, :trade_id, :img_url, :created_at


  end