class CurrentUser
  attr_accessor :user, :city

  def logged?
    !!@user
  end

  def self.set(request, user, city = nil)
    current_user = CurrentUser.new
    current_user.user = user
    current_user.city = city || user.city || City.find_by_code('beijing')
    request.session[:user_id] = user.id if user
    request.session[:city_id] = city.id if city

    current_user
  end

  def self.get(request)
    if request.session[:user_id]
      user = User.find(request.session[:user_id])
    elsif request.cookies[:p_session_id]
      user = User.find_by_password(request.cookies[:p_session_id])
    else
      user = nil
    end

    city = user && user.city || City.find_by_code('beijing')

    current_user = CurrentUser.new
    current_user.user = user
    current_user.city = city

    current_user
  end

  def self.logout(request)
    request.reset_session
  end
end