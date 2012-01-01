class ApplicationController < ActionController::Base
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

end
