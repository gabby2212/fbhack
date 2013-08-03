require 'test_helper'

describe User do

  let(:alice) { User.new }
  
  it "has_many sent_payments" do
    payment = alice.sent_payments.build
    alice.sent_payments.must_equal [payment]
  end

  it "has_many received_payments" do
    payment = alice.received_payments.build
    alice.received_payments.must_equal [payment]
  end
end
