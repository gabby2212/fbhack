class Payment < ActiveRecord::Base
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	def create
		optimize_payment(user, amount)
	end

	def optimize_payment(user, amount)
		total = amount
		@sent_payments =  user.sent_payments

	end
end