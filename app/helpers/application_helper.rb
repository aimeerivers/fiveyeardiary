module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def twitter_blueprint_alert_type(type)
    return 'error' if type == :alert
    return 'success' if type == :notice
    return type
  end

end
