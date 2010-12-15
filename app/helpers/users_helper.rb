module UsersHelper

  def calendar_head
    date_hash={}
    (-3..3).to_a.reverse.each do |i|
      time=Time.now-i.day
      if(i==0)
        f_time=format_date_with_year(time)
      else
        f_time=time.day
      end
      date_hash=date_hash.merge({format_date(time)=>f_time})
    end
    puts date_hash
    return date_hash.sort
  end

  def format_date_with_year(time)
    "<div>#{time.strftime("%Y.%m")}<div>#{time.day}".html_safe
  end
  
end
