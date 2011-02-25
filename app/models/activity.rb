class Activity < ActiveRecord::Base
  belongs_to :city
  belongs_to :area
  belongs_to :street
  belongs_to :site
  belongs_to :activity
  belongs_to :root_category, :class_name => 'Category', :foreign_key => 'root_category_id'

  def full_url
    ApiController::API_ROOT + "activities/#{self.id}"
  end
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

  def summary
    return nil if self.description.nil?
    doc = Nokogiri::XML(self.description)
    doc.text[0..80]
  end

  def to_xml(options={})
#    {
#        :id => self.id,
#        :title => self.title
#    }.to_xml
    options[:indent] ||= 2
    options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
    builder = options[:builder]
    builder.activity :url => self.full_url do
      builder.id self.id
      builder.title self.title
      builder.url self.full_url
      builder.summary self.summary
      builder.category self.root_category && self.root_category.name
      builder.latitude self.lat
      builder.longitude self.lng
      builder.venue "" #TODO
      builder.address self.address_desc
      builder.city self.city.name
      builder.tag!('contact-name', self.contact_person)
      builder.tag!('contact-phone', self.contact_phone)
      builder.start_time ftime(self.start_time)
      builder.end_time ftime(self.end_time)
      builder.price self.price
      builder.tag!('original-price', '')
      builder.status 'open'
      builder.description self.description
      builder.weblink self.weblink
    end
  end

  protected
  def ftime(time)
    return nil if time.nil?
    time.strftime("%Y-%m-%d %H:%M:%S")
  end

end
