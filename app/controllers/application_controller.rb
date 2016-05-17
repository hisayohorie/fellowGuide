class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Guide)
      guide_path(resource)
    elsif resource.is_a?(Visitor)
      guides_path
    end
  end

  def configure_permitted_parameters
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:name, :email, :password, :password_confirmation, :current_password, :city, :rate,:photo, :description)
   # Your block here.
=======
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,:last_name,:id, :name, :email, :password, :password_confirmation, :photo, :rate, :city])

>>>>>>> a6c6827ac119e04544e190037a4db5816bc90b52
  end
 end
  #   devise_parameter_sanitizer.for(:account_update) { |u|
  #     u.permit(:name, :email, :password, :password_confirmation, :current_password, :city, :rate,:photo, :description)
  #   }
  # end

# helper_method :current_visitor




end
