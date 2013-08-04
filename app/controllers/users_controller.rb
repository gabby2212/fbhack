class UsersController < Devise::RegistrationsController

  def json
  	@users = User.find(:all)
  	render json: {data: @users}
    # # @user = User.find_by_id(params[:user][:id])  
    # if @user
    #   @user.is_teacher = params[:user][:is_teacher]
    #   Rails.logger.debug(params[:user][:is_teacher])
    #   @user.save  
    #   Rails.logger.debug("--> success")  
    #   render json: {response: "success"}
    # else
    #   Rails.logger.debug("--> fail")  
    #   render json: {response: "fail"}
    # end
  end

  protected

  def sign_up(resource_name, resource)
    super(resource_name, resource)
    REDIS.publish 'hawala:userCreated', UserSerializer.new(resource).to_json(root: false)
  end
end