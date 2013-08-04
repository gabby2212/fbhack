class Relationship < ActiveRecord::Base
	attr_accessible :amount, :from_id, :to_id, :users_involved

	# def self.update_relationship(from, to, amount)
	# 	users_involved = [from, to].sort.join("_")
	# 	relationship = Relationship.where(users_involved: users_involved).first
	# 	if relationship == nil
	# 		relationship = Relationship.create(amount: amount, from_id: from.id, to_id: to.id, users_involved: users_involved)
	# 	else
	# 		if relationship.from_id == from.id
	# 			relationship.amount += amount
	# 		else
	# 			relationship.amount -= amount
	# 		end
	# 		if relationship.amount < 0
	# 			relationship.from_id = to.id
	# 			relationship.to_id = from.id
	# 			relationship.amount = -relationship.amount
	# 		elsif relationship.amount == 0
	# 			relationship.delete
	# 		end

	# 		if relationship.save
	# 			Rails.logger.debug("relationship saved!!")
	# 		end
	# 	end			
	# end

	def self.goThroughPath(path, amount)
	 	i = 0
	 	while i < (path.length - 1) do
	 		Rails.logger.debug(path)
	 		rel = Relationship.where(from_id: path[i].id, to_id: path[i+1].id).first
	 		rel.amount = rel.amount - amount
	 		if rel.amount == 0
	 			rel.delete
	 		elsif rel.save
	 			Rails.logger.debug("relationship saved2!!")
	 		end
	 		i = i + 1
	 	end
	end

	def self.find_path(current_user, user, amount, path, remainingAmount)
		Rails.logger.debug("recursion")
		if user == current_user
			goThroughPath(path, amount)
			remainingAmount -= amount
			return remainingAmount
		else
			rel = Relationship.where(from_id: user)
			rel.each do |r|
				if r.amount > amount
					newPath = path.push(User.find_by_id(r.to_id))
					remainingAmount = find_path(current_user, User.find_by_id(r.to_id), amount, newPath, remainingAmount)
				else
					amount = r.amount
					newPath = path.push(User.find_by_id(r.to_id))
					remainingAmount = find_path(current_user, User.find_by_id(r.to_id), amount, newPath, remainingAmount)
				end
			end
			return remainingAmount
		end
	end

	def self.pay(sender, receiver, amount)
		path = [receiver]
		remainingAmount = find_path(sender, receiver, amount, path, amount)

		if remainingAmount > 0
			relationship = Relationship.where(from_id: sender.id, to_id: receiver.id).first
			if relationship == nil
				Relationship.create(from_id: sender.id, to_id: receiver.id, amount: remainingAmount)
			else
				relationship.amount += remainingAmount
				relationship.save
			end
		end
	end
end