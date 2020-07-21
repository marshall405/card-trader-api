class TradeSerializer < ActiveModel::Serializer
  
  attributes :id, :trader_id, :tradee_id, :requested_card_id, :status, :requested_card, :cards, :tradee, :trader
  

  def tradee
    {
      username: object.tradee.username,
    }
  end

  def trader
    {
      username: object.trader.username,
    }
  end
end
