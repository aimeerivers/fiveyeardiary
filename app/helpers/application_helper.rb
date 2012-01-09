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

end
