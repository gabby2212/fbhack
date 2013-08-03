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
			r = Relationship.find(:from_id => n.id && :to_id => path.nodes[index])
			r.amount = r.amount - path.amount
			r.save
		end

	end
end