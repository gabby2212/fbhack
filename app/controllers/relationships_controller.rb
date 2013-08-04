class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
	def index
		@relationships = Relationship.where(from_id: current_user.id)
		@relationships2 = Relationship.where(to_id: current_user.id)
		@relationships = @relationships + @relationships2
		Rails.logger.debug("#{@relationships}")
		@relationships
	end

end