class LoginController < ApplicationController
  def login

  end

  def auth
    @user = User.authorize(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      session[:login] = @user.login
      session[:city_id] = @user.city_id
      @user.update_attributes(:last_login_at => Time.now)
      if params[:persist] == "1"
        cookies[:p_session_id] = {:value => @user.password, :expires => Time.now + 7.months}
      else
        cookies[:p_session_id] = nil
      end
      #      UserMailer.welcome_email(@user).deliver
      redirect_to "/"
    else
      flash.now[:error]="用户名或密码不正确"
      render :action => :login
    end
  end


  #退出登陆
  def logout
    session[:user_id] = nil
    session[:login] = nil
    cookies[:p_session_id] = nil
    Thread.current["user"] = nil
    redirect_to :action => :login
  end

  def signup

  end
end
