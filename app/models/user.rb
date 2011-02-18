class User < ActiveRecord::Base
  belongs_to :city

  PASSWORD_SALT = "salt_it"

  #登录验证
  def self.authorize(login, password)
    user = User.find_by_login(login)
    unless user.nil?
      password_hashcode = Digest::SHA1.hexdigest(login + password)
      return user if  password_hashcode == user.password
    end
    nil
  end

  def touch_last_login_at
    update_attributes(:last_login_at => Time.now)
  end

  def encrypted_password
    Digest::SHA1.hexdigest(login + password + PASSWORD_SALT)
  end

  #validates
#  validates :email, :presence => true,
#            :length => {:maximum =>50},
#            :format=>{:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i},
##            :uniqueness => true,
#            :message => '邮箱必须填写正确的格式',
#            :on => :save
#
#  validates :password, :presence=>true,
#            :length => {:minimum => 6, :maximum =>40},
#            :confirmation => true,
#            :message => '密码不能为空，最小长度为6位，两次输入密码必须一致'

  validate do |user|
    if user.login.blank?
      user.errors.add(:login, "用户名不能为空")
    end
    if user.login && user.login.length < 6
      user.errors.add(:login, "用户名不能少于6位")
    end
    if user.email.blank?
      user.errors.add(:email, "邮箱不能为空")
    end
    if !user.email.match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
      user.errors.add(:email, "邮箱格式不正确")
    end
    if user.password != user.password_confirmation
      user.errors.add(:password, "密码两次输入不一致")
    end
  end
  #设置激活码
  def set_activate_code
    self.activate_code = Digest::SHA1.hexdigest("--#{self.email}--#{self.password}--");
  end

  def before_create
    self.password = encrypted_password
  end
#  #是否激活
#  NOT_ACTIVE=0
#  ACTIVED=1

#  before_create :encrypted_password
#  before_create :set_active_code

#  #创建很多活动
#  has_many :activities
#
#  #有很多消息
#  has_many :messages
#
#  # 加入很多群组
#  has_many :group_users
#  has_many :groups, :through => :group_users
#
#  #持久化登录
#  has_one  :persistent_login,:class_name => "PersistentLogin"

#  #属于某地
#  belongs_to :street,:foreign_key=>"locale_id"
#
#  def city
#    self.street.area.city
#  end


end
