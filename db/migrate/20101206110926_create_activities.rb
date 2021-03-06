class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.string :title #主题
      t.text :description #详细内容
      t.integer :root_category_id
      t.integer :category_id
      t.integer :city_id #城市
      t.integer :area_id #区
      t.integer :street_id #街道
      t.string   :address_desc #用户输入的地址信息
      t.string :contact_person
      t.string :contact #联系方式
      t.string :contact_phone #联系人电话
      t.string :contact_qq #联系人QQ
      t.text :about #参会须知

      t.integer :site_id
      t.string :site_code

      t.float :lat #纬度
      t.float :lng #经度

      t.integer :status #活动状态(0: pending待审核 1: published审核通过,发布状态 2: denied审核不通过 3: expired超期 4. deleted删除)

      t.timestamp :start_time #开始时间
      t.timestamp :end_time #结束时间

      t.integer :price #费用
      t.integer :price_return #返还费用
      t.text :price_intro #返还费用

      t.integer :recommand #首页推荐

      t.string :weblink #活动主页
      t.integer :form #举办形式
      t.integer :identity #发起身份
      t.string :reserve_intro #预约说明
      t.integer :reserve_num #预约人数
      t.integer :group_id #群组
      t.integer :aptitude #资质


      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
