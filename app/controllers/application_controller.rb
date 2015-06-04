class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:status, :email, :password, :password_confirmation, :remember_me) }
  end

  def admin_only
    unless current_user.admin?
      redirect_to root_url, :alert => "Only admin can access this page"
    end
  end
end
