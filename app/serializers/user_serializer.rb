class UserSerializer < ActiveModel::Serializer
  attributes :id
  has_many :sent_payments

end