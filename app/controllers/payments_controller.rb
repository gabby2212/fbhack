class PaymentsController < ApplicationController
	before_filter :require_current_user

	def index
		@payments = current_user.payments
	end

	def create
		@relation = Relationship.where(from_id: current_user.id, to_id: params[:receiver_id])
		@inverse_relation = Relationship.find(from_id: params[:receiver_id], :to_id: current_user.id)
		Rails.logger.debug("here")
		if @relation
		 	@relation.amount += params[:amount]
		else
			@relation = Relationship.create(amount: params[:amount], from_id: current_user.id, to_id: params[:receiver_id])
			@relation.save
		end
		if @inverse_relation
		 	@inverse_relation.amount -= params[:amount]
		else
			@inverse_relation = Relationship.create(amount: params[:amount], from_id: params[:receiver_id], to_id: current_user.id)
			@inverse_relation.save
		end

		@payment = Payment.new
		@payment.submit(params[:payment])
		# @path_so_far = Path.new(params[:amount], [params[:user]])
		# @path_so_far = find_path(user, amount, @path_so_far)
		@payment
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