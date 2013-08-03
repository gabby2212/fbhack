class PaymentsController < ApplicationController
	before_filter :require_current_user
	
	def index
		@payments = current_user.payments
	end

	def create
		@payment = current_user.payments.build
		@payment.save
	end
end