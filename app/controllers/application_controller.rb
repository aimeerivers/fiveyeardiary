class ApplicationController < ActionController::Base

  before_filter :set_time_zone

  protect_from_forgery

  helper_method :current_user, :user_signed_in?

  protected

  def authenticate
    if !user_signed_in?
      redirect_to sign_in_url, alert: "Please sign in first"
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def set_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end

end
