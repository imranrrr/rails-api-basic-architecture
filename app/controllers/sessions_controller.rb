# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  protect_from_forgery with: :null_session

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :login, :password, :remember_me])
  end

  private 

  def respond_with(resource, _opts = {})
    if resource.persisted?
      respond_to :json
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

  def respond_to_on_destroy
    if current_user 
      respond_to :json
      render json: {
        status: true,
        data: {message: "logged out successfully"}
      }
    else
      respond_to :json
      render json: { 
        status: false,
       data:{ message: "Couldn't find an active session."}
      }
    end
  end
end
