class RegistrationsController < Devise::RegistrationsController
	protect_from_forgery with: :null_session
  before_action :configure_sign_up_params, only: [:create]
  
  
  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :paypal_email])
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        status: true,
        data: {user: UserSerializer.new(resource).serializable_hash[:data][:attributes]}
      }
    else
      render json: {
        status: false, 
        data: {error: resource.errors.full_messages}
      }
    end
  end
	
end