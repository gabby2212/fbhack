class RelationshipssController < ApplicationController
	def index
		@relationships = Relationship.where(from_id: current_user.id || to_id: current_user.id)
	end
end