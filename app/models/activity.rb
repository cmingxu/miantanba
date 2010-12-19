class Activity < ActiveRecord::Base
  belongs_to :city
  
  #发起身份
  REAL_NAME = 1
  VIRTUAL_NAME = 2
  GROUP =3
  IDENTITY={REAL_NAME=>"个人实名",VIRTUAL_NAME=>"个人网名",GROUP=>"群组身份"}

  #举办形式
  PUBLIC = 1
  PRIVATE = 2
  FORM={PUBLIC=>"公开",PRIVATE=>"私密"}

  #参加资质
  ALL = 1 #所有人
  SPECIAL = 2 #特殊人（实名认证的人）
  APTITUDE={ALL=>"所有人",SPECIAL=>"实名认证会员"}

  #活动状态
  PASS=1 #审核通过
  UPPASS=2 #审核未通过

  validates :title,:topic,:contact,:about,:price,:price_return,:price_intro,:reserve_intro,:reserve_num,:presence=>true
  validates :price,:price_return,:numericality => true

  def self.hot(city)
    where(:city_id => city)
  end
  
end
