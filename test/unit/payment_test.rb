require 'test_helper'

describe Payment do
  let(:payment) { Payment.new }
  it "belongs_to sender" do
    user = payment.build_sender 
    user.class.must_equal User
    payment.sender.must_equal user
  end

  it "belongs_to receiver" do
    user = payment.build_receiver
    user.class.must_equal User
    payment.receiver.must_equal user
  end
end