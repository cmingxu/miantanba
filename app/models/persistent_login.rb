class PersistentLogin < ActiveRecord::Base
  belongs_to :user
  before_create :assign_uid

  private
  # 设置登录保护密码
  def assign_uid
    self.uid=Digest::SHA1.hexdigest(Time.now.to_s);
  end
end