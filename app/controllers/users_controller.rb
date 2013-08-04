class UsersController < Devise::RegistrationsController

  protected

  def sign_up(resource_name, resource)
    super(resource_name, resource)
    REDIS.publish 'hawala:userCreated', UserSerializer.new(resource).to_json(root: false)
  end
end