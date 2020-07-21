class UserSerializer < ActiveModel::Serializer
  
    attributes :username, :email, :id, :cards

  end