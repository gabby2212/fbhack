class WelcomeController < ApplicationController
	def index
		redirect_to '/users/sign_up'
	end
end