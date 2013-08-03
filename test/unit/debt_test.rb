require 'test_helper'

class DebtTest < ActiveSupport::TestCase
  let(:debt) { Debt.new }
  it "belongs_to lender" do
    user = debt.build_lender
    user.class.must_equal User
    debt.lender.must_equal user
  end

  it "belongs_to borrower" do
    user = debt.build_borrower
    user.class.must_equal User
    debt.borrower.must_equal user
  end
end
