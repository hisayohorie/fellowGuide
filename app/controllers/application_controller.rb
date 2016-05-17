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


  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :visitor
  end

  def resource
    @resource ||= Visitor.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:visitor]
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

# helper_method :current_visitor




end
