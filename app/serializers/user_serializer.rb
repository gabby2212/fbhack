class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :sent_payments
end