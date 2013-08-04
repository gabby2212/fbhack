class Payment < ActiveRecord::Base
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'
	attr_accessible :amount, :sender_id, :receiver_id


	def sent_payments(user)
		@relationships = Relationship.find(:all, :conditions => { :from_id => user.id})
	end
end