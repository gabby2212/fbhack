class WelcomeController < ApplicationController
	def index
	end
  def test
    users = User.scoped.includes(:sent_payments)
    @users_json = ActiveModel::ArraySerializer.new(users).to_json
  end
end