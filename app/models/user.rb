class User < ActiveRecord::Base
  #是否激活
  NOT_ACTIVE=0
  ACTIVED=1
  
  before_create :encrypted_password
  before_create :set_active_code

  #创建很多活动
  has_many :activities

  #有很多消息
  has_many :messages

  # 加入很多群组
  has_many :group_users
  has_many :groups, :through => :group_users

  #持久化登录
  has_one  :persistent_login,:class_name => "PersistentLogin"

  #属于某地
  belongs_to :street,:foreign_key=>"locale_id"

  def city
    self.street.area.city
  end

  


  #validates
  validates :email,:presence => true,
    :length => { :maximum =>50 },
    :format=>{ :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i},
    :uniqueness => true,
    :on => :save

  validates :display_name,:presence=>true,
    :length => {  :minimum => 3,:maximum =>20 },
    :format=>{ :with => /^[A-Za-z\s0-9_-]{1,20}$/i},
    :uniqueness => true

  validates :password, :presence=>true,
    :length => {  :minimum => 6,:maximum =>40 },
    :confirmation => true

  
  #密码加密
  def encrypted_password
    self.password = Digest::SHA1.hexdigest(self.email+self.password);
    self.password_confirmation = Digest::SHA1.hexdigest(self.email+self.password_confirmation);
  end

  #设置激活码
  def set_active_code
    self.active_code=Digest::SHA1.hexdigest("--#{self.email}--#{self.password}--");
  end

  #登录验证
  def self.authorize(login_name, password)
    user = User.find_by_email(login_name)
    unless user.nil?
      email = user.email
      password_hashcode = Digest::SHA1.hexdigest(email+password);
      return user if  password_hashcode == user.password
    end
    nil
  end
  
end
