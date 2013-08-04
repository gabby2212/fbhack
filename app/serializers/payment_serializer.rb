class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :amount
end