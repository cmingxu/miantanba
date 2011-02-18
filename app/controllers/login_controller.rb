class LoginController < ApplicationController
  def login

  end

  def auth
    @user = User.authorize(params[:email], params[:password])
    if @user
      CurrentUser.set(request, @user, @user.city)
      @user.update_attributes(:last_login_at => Time.now)
      if params[:persist] == "1"
        cookies[:p_session_id] = {:value => @user.password, :expires => Time.now + 7.months}
      else
        cookies[:p_session_id] = nil
      end
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
    render :action => :signup
  end

  def post_signup
    @user=User.new(params[:user])
    @user.level=0
    @user.mianzi=0
    if @user.save
      CurrentUser.set(request, @user, @user.city)
      
      #      UserMailer.welcome_email(@user).deliver
      redirect_to '/'
    else
      render :action =>:signup
    end
  end
end
