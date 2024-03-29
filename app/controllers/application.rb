# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_videoshelf_session_id'
  
  def authorize
    unless (@app_user = User.find_by_id(session[:user_id]))
      redirect_to_login
    end
  end
  
  def redirect_to_login
    redirect_to(:controller => "login", :action => "login")
  end
end
