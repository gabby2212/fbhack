class Relationship < ActiveRecord::Base
	attr_accessible :amount, :from_id, :to_id, :users_involved

	def self.update_relationship(from, to, amount)
		users_involved = [from, to].sort.join("_")
		relationship = Relationship.where(users_involved: users_involved).first
		if relationship == nil
			relationship = Relationship.create(amount: amount, from_id: from, to_id: to, users_involved: users_involved)
		else
			if relationship.from_id == from
				realtionship.amount += amount
			else
				relationship.amount -= amount
			end
			if relationship.amount < 0
				relationship.from_id = to
				relationship.to_id = from
				relationship.amount = -relationship.amount
			elsif relationship.amount == 0
				relationship.delete
			end
			relationship.save
		end


			
	end
end