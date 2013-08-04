class WelcomeController < ApplicationController
	def index
		redirect_to '/users/sign_up'
	end
  def test
    users = User.scoped.includes(:sent_payments)
    @users_json = ActiveModel::ArraySerializer.new(users).to_json
  end
end