class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    brands_path
  end

  def after_sign_out_path_for(resource_or_scope)
    home_path
  end

  # def brand_authentication!
      # flash[:error] = "You don't have access to this brand."
      # redirect_to :back
  # end

  # def authenticate_admin!
  #   redirect_to "/" unless current_user && current_user.admin
  # end

end
