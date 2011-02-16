namespace :demo do
  task :test => :environment do 
    s= Activity.first.title
    f = File.open("d:/a.txt", "w")
    f.write(s)
    f.close
  end
  
  namespace :clear do
    task :cities do
      City.delete_all
    end
    task :categories do
      Category.delete_all
    end
    task :users do
      User.delete_all
    end
    task :activities do
      Activity.delete_all
    end
  end

  namespace :init do
    task :all => :environment do
      ['cities', 'categories', 'users', 'activities'].each do |c|
        Rake::Task["demo:clear:#{c}"].invoke
        Rake::Task["demo:init:#{c}"].invoke
      end
    end

    task :cities => :environment do
      City.create(:name => '北京', :code => 'beijing', :short_code => 'bj', :lng => 116.41667, :lat => 39.91667)
      City.create(:name => '上海', :code => 'shanghai', :short_code => 'sh', :lng => 121.43333, :lat => 34.50000)
    end

    task :categories => :environment do
      Category.create(:name => '会展', :code => 'huizhan')
      Category.create(:name => '郊游', :code => 'jiaoyou')
    end
    
    task :users => :environment do
      User.create(:login => 'sliu', :password => '', :real_name => '刘松', :city_id => City.get(:beijing))
      User.create(:login => 'hut', :password => '', :real_name => '胡core', :city_id => City.get(:beijing))
    end
    
    task :activities => :environment do
      sliu = User.where(:login => 'sliu').first
      beijing = City.get(:beijing)
      jiaoyou = Category.where(:code => 'jiaoyou').first
      Activity.create(:title => '圣诞节单身派对今天报名啦!100元超值',
                   :user_id => sliu,
                    :category_id => jiaoyou,
                    :city_id => beijing,
                    :start_time => '2010-10-5',
                    :end_time => '2010-10-30',
                    :address_desc => '东直门附近 、海淀魏公村附近 ',
                    :description => "男人.女人.不要一个人走太久.你优秀也好,平凡也罢.一个人的日子,是不是已经疲惫不堪了呢?　年龄越大，婚姻市场越贬值。追求爱情越早越好。不着急是自我安慰的话，人生好时光不长，爱情象吃饭一样，每时每刻都需要珍惜。越年轻爱情的动力越足，一旦拥有爱时，最具有诗情画意的色彩，年龄越大就越现实，容易错失好机会。 　在寻找爱情方面，不要消极等待，早下手要比晚下手好。据统计,早结婚的人群要比晚结婚的人群会幸福很多.人生三大幸福，好父母，好老婆（老公），好子女。 假如说你是单身男士或者女士,正是适龄,那是你的幸运,快给我打个电话吧.抓住你的幸福.假如您已经很大了,或者离异了,看到帖子，给我打电话吧，给自己也给为爱情机会，那是上天赐予的,无论如何不能错过.
　　　　*聚会形式*轻松地聊天，让大家随意地谈谈，相互认识。集体活动（杀人游戏，7日婚姻速配,八分钟交友，闪电交友，真心话大冒险，约会1 1，堂审约会，友缘对对碰，缘分亲手抓等）让大家尽情的展示自己，并不是一定要抱着结束单身的迫切目的，而是让我们寻找一种共同的语言，在孤独的时候，有三五朋友可以静静地坐着聊聊天，寻找一些快乐。
　　　　 [活动场地]占地800多平---只要你有大专以上学历，年龄在男23岁以上， 女22岁以上就可以带身份证或驾照免费体验活动。
　　　　需要电话或短信报名，
　　　　
　　　　报名格式：姓名/学历/性别/年龄/职业/手机号码
　　　　
　　　　活动咨询方式 ：李心.　
　　　
　　　　活动地址：东直门附近 、海淀魏公村附近
　　　　
　　　　特别适合以下单身朋友参加:
　　　　 1. 受过高等教育的单身人士
　　　　 2. 工作繁忙而没有时间结交异性朋友
联系我时请说明是在58同城看到的，谢谢！"
                    )
      Activity.create(:title => '心理学专业，交个朋友',
                      :user_id => sliu,
                      :category_id => jiaoyou,
                      :city_id => beijing,
                      :start_time => '2010-10-5',
                      :end_time => '2011-04-22',
                      :address_desc => '清华大学',
                      :description => "感兴趣的都可交个朋友也行"
      )
    end
  end
end