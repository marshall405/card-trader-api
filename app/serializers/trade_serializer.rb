class TradeSerializer < ActiveModel::Serializer
  attributes :id, :trader_id, :tradee_id, :requested_card_id
end
