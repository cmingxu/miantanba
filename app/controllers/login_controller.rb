class LoginController < ApplicationController
  def index

  end

  def login
    @user = User.authorize(params[:email], params[:password])
    if @user.kind_of? User
      session[:user_id] = @user.id
      session[:display_name]=@user.display_name
      User.update(session[:user_id], :last_login_at => Time.now)
      session[:last_access] = Time.now
      session[:city_id]=@user.city.id
      if params[:persist] == "1"
        if @user.persistent_login.nil?
          p = PersistentLogin.create(:user_id => @user.id)
          cookies[:p_session_id] = {:value => p.uid, :expires => Time.now + 7.days}
        else
          p = @user.persistent_login
          cookies[:p_session_id] = {:value => p.uid, :expires => Time.now + 7.days}
        end
      end
      #      UserMailer.welcome_email(@user).deliver
      redirect_to :controller=>:users,:action=>:index
    else
      flash.now[:error]="用户名或密码不正确"
      render :action=>:index
    end
  end

  #退出登陆
  def logout
    session[:user_id] = nil
    session[:display_name] = nil
    if cookies[:p_session_id]
      p = PersistentLogin.find_by_uid(cookies[:p_session_id])
      if !p.blank?
        PersistentLogin.destroy(p.id)
      end
    end
    Thread.current["user"] = nil
    redirect_to :action => :login
  end
end
