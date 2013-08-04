class Payment < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates_presence_of :sender
  validates_presence_of :receiver
  validates_numericality_of :amount, greater_than: 0
  validate :sender_not_equal_receiver

  private

  def sender_not_equal_receiver
    if sender && receiver && sender == receiver
      errors[:base].push("You cannot pay money to yourself")
    end
  end

end