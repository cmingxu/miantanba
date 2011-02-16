module ApplicationHelper
  def ftime(time)
    time && time.strftime("%Y-%m-%d %H:%M")
  end

  def fdate(time)
    time && time.strftime("%Y-%m-%d")
  end

  def errors_for(object, message=nil)
    html = ""
    if object and !object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end
      else
        html << "<h5>#{message}</h5>"
      end
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html.html_safe
  end


  def format_date(time)
    time.strftime('%Y-%m-%d')
  end

end
