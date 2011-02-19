# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user, :current_city

  before_filter :load_current_user

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '92d95606680c0ccf692470918c78acc4'

  def load_current_user
    @current_user ||= CurrentUser.get(request)
  end

  def current_user
    @current_user
  end

  def current_city
    current_user.city
  end
end
