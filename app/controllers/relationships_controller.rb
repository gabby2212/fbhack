class RelationshipsController < ApplicationController
	def index
		@relationships = Relationship.where(from_id: current_user.id)
		@relationships2 = Relationship.where(to_id: current_user.id)
		@relationships.push(@relationships2)
		Rails.logger.debug("#{@relationships}")
		@relationships
	end
end