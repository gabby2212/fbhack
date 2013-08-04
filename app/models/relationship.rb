class Relationship < ActiveRecord::Base
	attr_accessible :amount, :from_id, :to_id
end