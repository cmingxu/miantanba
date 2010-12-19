class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.string :title #主题
      t.text :topic #主要议题
      t.integer :locale_id #地点
      t.integer :city_id #城市 
      t.string :contact #联系方式
      t.integer :category_id
      t.text :about #参会须知
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
      t.integer :status #活动状态(审核通过，未通过)
      t.timestamp :start_time #开始时间
      t.timestamp :end_time #结束时间
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
