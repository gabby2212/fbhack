class Path
	def initializer(amount, nodes)
		@amount = amount
		@nodes = nodes || []
	end

	def add_user(user)
		@nodes = @nodes.push(user)
	end
end