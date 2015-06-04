class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def admin_only
    unless current_user.admin?
      redirect_to root_url, :alert => "Only admin can access this page"
    end
  end
end
