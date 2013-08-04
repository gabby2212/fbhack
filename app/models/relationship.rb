class Relationship < ActiveRecord::Base
	attr_accessible :amount, :from_id, :to_id

	def self.update_relationship(from, to, amount)
		@relationship = Relationship.where(from_id: from, to_id: to).first
		@inverse_relationship = Relationship.where(from_id: to, to_id: from).first
		if @relationship == nil
			@relationship = Relationship.create(amount: amount, from_id: from, to_id: to)
			@relationship.save
		else
			@relationship.amount += amount.to_f
			@relationship.save
		end
		if @inverse_relationship == nil
			@inverse_relationship = Relationship.create(amount: amount, from_id: to, to_id: from)
			@inverse_relationship.save		 	
		else
			@inverse_relationship.amount -= amount.to_f
			@inverse_relationship.save			
		end
	end
end