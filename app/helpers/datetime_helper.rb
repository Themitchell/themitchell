module DatetimeHelper

  def marked_up_date_or_time(date, format = :default)
    timestamp = DateTime.parse(date.to_s)
    content_tag(:time, localize(date, format: format), datetime: date.iso8601)
  end

end
