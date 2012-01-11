module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def twitter_blueprint_alert_type(type)
    return 'error' if type == :alert
    return 'success' if type == :notice
    return type
  end

  def friendly_date(date)
    day = date.strftime('%e')
    "#{date.strftime('%A')} #{ActiveSupport::Inflector.ordinalize(day)} #{date.strftime('%B %Y')}"
  end

  def previous_week(current_year, current_week_number)
    previous_week_number = current_week_number.to_i - 1
    previous_year = current_year.to_i
    if previous_week_number < 1
      previous_week_number = 52
      previous_year -= 1
    end
    [previous_year, previous_week_number]
  end

  def next_week(current_year, current_week_number)
    next_week_number = current_week_number.to_i + 1
    next_year = current_year.to_i
    if next_week_number > 52
      next_week_number = 1
      next_year += 1
    end
    [next_year, next_week_number]
  end

end
