# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :login_from_cookies
  before_filter :set_thread_data
  before_filter :load_parent
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '92d95606680c0ccf692470918c78acc4'

  before_filter :check_city
  
  # 从cookies中自动登陆
  def login_from_cookies
    if cookies[:p_session_id] && p = PersistentLogin.find_by_uid(cookies[:p_session_id])
      session[:user_id] = p.user_id
      @log_user = User.find(p.user_id)
      session[:display_name]=@log_user.display_name
      @log_user.update_attribute(:last_login_at, Time.now)
      # session[:locale] = @log_user.user_language
      # current_user
    end
  end
  
  #设置线程上下文,设置log记录数据库和线程 current_user
  def set_thread_data
    # current_user 在整个系统中实现当前用户的调用，为了兼容已有@current_user,保留 @current_user实例变量
    Thread.current["user_id"] = session[:user_id]
    Thread.current["user"] = User.find(session[:user_id]) if session[:user_id]
    @current_user ||= Thread.current["user"] if session[:user_id]
    Thread.current["ip"] = request.remote_ip
    Thread.current["session"] = request.inspect
    Thread.current["parameters"] = request.parameters
  end


  def clear_cookies
    cookies["#{CN_PREFIX}auth"] = {:expires => Time.now.yesterday}
    cookies["#{EN_PREFIX}auth"] = {:expires => Time.now.yesterday}
    cookies["#{CN_PREFIX}sid"] = {:expires => Time.now.yesterday}
    cookies["#{EN_PREFIX}sid"] = {:expires => Time.now.yesterday}
    #    cookies["#{CN_PREFIX}onlineusernum"] = {:expires => Time.now.yesterday}
    #    cookies["#{EN_PREFIX}onlineusernum"] = {:expires => Time.now.yesterday}
  end


  #加载父类
  def load_parent
    Locale
  end

  # 确定城市 
  def check_city
    @current_city = City.first
  end

  def current_city
    @current_city
  end
  
end
