class Activity < ActiveRecord::Base
  belongs_to :city
  belongs_to :area
  belongs_to :street
  belongs_to :site
  belongs_to :activity
  belongs_to :root_activity, :class_name => 'Activity', :foreign_key => 'root_activity_id'
  
#
#  #发起身份
#  REAL_NAME = 1
#  VIRTUAL_NAME = 2
#  GROUP =3
#  IDENTITY={REAL_NAME=>"个人实名",VIRTUAL_NAME=>"个人网名",GROUP=>"群组身份"}
#
#  #举办形式
#  PUBLIC = 1
#  PRIVATE = 2
#  FORM={PUBLIC=>"公开",PRIVATE=>"私密"}
#
#  #参加资质
#  ALL = 1 #所有人
#  SPECIAL = 2 #特殊人（实名认证的人）
#  APTITUDE={ALL=>"所有人",SPECIAL=>"实名认证会员"}
#
#
#  validates :title,:topic,:contact,:about,:price,:price_return,:price_intro,:reserve_intro,:reserve_num,:presence=>true
#  validates :price,:price_return,:numericality => true


  #  活动状态(0: pending待审核 1: published审核通过,发布状态 2: denied审核不通过 3: expired超期 4. deleted删除)
  STATUS_PENDING = 0
  STATUS_PUBLISHED = 1
  STATUS_DENIED = 2
  STATUS_EXPIRED = 3
  STATUS_DELETED = 4
  
  def self.published
    where(:status => STATUS_PUBLISHED)
  end
  
end
