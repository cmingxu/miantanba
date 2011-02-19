class InitCategories < ActiveRecord::Migration
  def self.up
    huizhan = Category.create(:name => '会展', :code => 'huizhan')
    Category.create(:name => '供需展销', :code => 'gongxuzhanxiao', :parent_id => huizhan.id)
    Category.create(:name => '人才招聘', :code => 'rencaizhaopin', :parent_id => huizhan.id)
    Category.create(:name => '产品发布', :code => 'chanpinfabu', :parent_id => huizhan.id)
    Category.create(:name => '展览展示', :code => 'zhanlanzhanshi', :parent_id => huizhan.id)
    Category.create(:name => '招商引资', :code => 'zhaoshangyinzi', :parent_id => huizhan.id)

    gongyi = Category.create(:name => '公益', :code => 'gongyi')
    Category.create(:name => '互助募捐', :code => 'huzhumujuan', :parent_id => gongyi.id)
    Category.create(:name => '义务献血', :code => 'yiwuxianxue', :parent_id => gongyi.id)
    Category.create(:name => '医疗咨询', :code => 'yiliaozixun', :parent_id => gongyi.id)
    Category.create(:name => '志愿活动', :code => 'zhiyuanhuodong', :parent_id => gongyi.id)
    Category.create(:name => '公益劳动', :code => 'gongyihuodong', :parent_id => gongyi.id)
    Category.create(:name => '听证庭审', :code => 'tingzhengtingshen', :parent_id => gongyi.id)

    xuexi = Category.create(:name => '学习', :code => 'xuexi')
    Category.create(:name => '培训讲座', :code => 'peixunjiangzuo', :parent_id => xuexi.id)
    Category.create(:name => '学术研讨', :code => 'xueshuyantao', :parent_id => xuexi.id)
    Category.create(:name => '专业论坛', :code => 'zhuanyeluntan', :parent_id => xuexi.id)
    Category.create(:name => '技术沙龙', :code => 'jishushalong', :parent_id => xuexi.id)
    Category.create(:name => '技能比赛', :code => 'jinengbisai', :parent_id => xuexi.id)
    Category.create(:name => '心得交流', :code => 'xindejiaoliu', :parent_id => xuexi.id)

    juhui = Category.create(:name => '聚会', :code => 'juhui')
    Category.create(:name => '同学聚会', :code => 'tongxuejuhui', :parent_id => juhui.id)
    Category.create(:name => '生日聚会', :code => 'shengrijuhui', :parent_id => juhui.id)
    Category.create(:name => '聚餐宴会', :code => 'jucanyanhui', :parent_id => juhui.id)
    Category.create(:name => 'K歌泡吧', :code => 'Kgepaoba', :parent_id => juhui.id)
    Category.create(:name => '酒会舞会', :code => 'jiuhuiwuhui', :parent_id => juhui.id)
    Category.create(:name => '典礼仪式', :code => 'dianliyishi', :parent_id => juhui.id)

    wenti = Category.create(:name => '文体', :code => 'wenti')
    Category.create(:name => '文体演出', :code => 'wentiyanchu', :parent_id => wenti.id)
    Category.create(:name => '比赛选拔', :code => 'bisaixuanba', :parent_id => wenti.id)
    Category.create(:name => '电影游戏', :code => 'dianyingyouxi', :parent_id => wenti.id)
    Category.create(:name => '庙会游园', :code => 'miaohuiyouyuan', :parent_id => wenti.id)
    Category.create(:name => '灯会晚会', :code => 'denghuiwanhui', :parent_id => wenti.id)
    Category.create(:name => '节日庆会', :code => 'jieriqinghui', :parent_id => wenti.id)

    shangwu = Category.create(:name => '商务', :code => 'shangwu')
    Category.create(:name => '企业年会', :code => 'qiyenianhui', :parent_id => shangwu.id)
    Category.create(:name => '部门例会', :code => 'bumenlihui', :parent_id => shangwu.id)
    Category.create(:name => '项目汇报', :code => 'xiangmuhuibao', :parent_id => shangwu.id)
    Category.create(:name => '开业奠基', :code => 'kaiyedianji', :parent_id => shangwu.id)
    Category.create(:name => '商务沙龙', :code => 'shangwushalong', :parent_id => shangwu.id)
    Category.create(:name => '业务洽谈', :code => 'yewuqiatan', :parent_id => shangwu.id)

    jiaoyou = Category.create(:name => '交友', :code => 'jiaoyou')
    Category.create(:name => '婚恋鹊桥', :code => 'hunlianqueqiao', :parent_id => jiaoyou.id)
    Category.create(:name => '私密约会', :code => 'simiyuehui', :parent_id => jiaoyou.id)
    Category.create(:name => '兴趣交友', :code => 'xingqujiaoyou', :parent_id => jiaoyou.id)
    Category.create(:name => '联谊活动', :code => 'lianyihuodong', :parent_id => jiaoyou.id)
    Category.create(:name => '旅游健身', :code => 'lvyoujianshen', :parent_id => jiaoyou.id)
    Category.create(:name => '运动棋牌', :code => 'yundongqipai', :parent_id => jiaoyou.id)

    qita = Category.create(:name => '其他', :code => 'qita')
  end

  def self.down
    Category.destroy_all
  end
end
