class PaymentsController < ApplicationController
	before_filter :require_current_user

	def index
		@payments = current_user.payments
	end

	def create
		@path_so_far = Path.initialize(params[:amount], [params[:user]])
		@path_so_far = find_path(user, amount, @path_so_far)
		@payment = current_user.payments.build
		@payment.save
	end

	def find_path(user, amount, path)
		current_amount = amount
		if user == current_user
			return path
		end
		user.sent_payments.each do |p|
			if p.amount <= current_amount
				current_amount = p.amount
				p.amount = 0
			else
	end
end