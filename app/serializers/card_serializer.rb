class CardSerializer < ActiveModel::Serializer
    attributes :category, :img_url, :id, :first_name, :last_name, :team, :year, :condition
  end