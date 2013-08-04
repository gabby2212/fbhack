class PaymentsController < ApplicationController
	before_filter :authenticate_user!

	def index
		@sent_payments = current_user.sent_payments
		@received_payments = current_user.received_payments
	end

	def new
		@payment = Payment.new
	end

	def create
		@payment = current_user.sent_payments.build
    	@payment.receiver = User.find_by_email(params[:to])
    	@payment.amount = params[:amount]
    	if @payment.save
		  	redirect_to payments_path
		  	Relationship.path_finder
		  	Relationship.update_relationship(current_user.id, @payment.receiver_id, @payment.amount)
    	else
      		render :new
    	end

		# @path_so_far = Path.new(params[:amount], [params[:user]])
		# @path_so_far = find_path(user, amount, @path_so_far)
	end

	def find_path(user, amount, path)
		@current_amount = amount
		if user == current_user
			go_through_path(path)
			return path
		end
		node = sent_payments(user)
		node.each do |p|
			if p.amount <= @current_amount
				@current_amount = p.amount
				# p.amount = 0
				path = path.add_user(user)
				find_path(p.user, @current_amount, path)
			else
				# p.amount = p.amount - @current_amount
				path = path.add_user(user)
				find_path(p.user, @current_amount, path)
			end
		end

	end

	def go_through_path(path)
		index = 1
		path.nodes.each do |n|
			if index == path.nodes.length - 1
				break
			end
			r = Relationship.where(:from_id => n.id)
			r.amount = r.amount - path.amount
			r.save
		end

	end
end