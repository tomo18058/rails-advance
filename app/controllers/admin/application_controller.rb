class Admin::ApplicationController < ApplicationController
  before_action :require_admin_login
  helper_method :current_admin_user

  private

  def require_admin_login
    return if session[:admin_user_id].present?
    redirect_to new_admin_session_path, alert: "ログインしてください"
  end

  def current_admin_user
    @current_admin_user ||= AdminUser.find_by(id: session[:admin_user_id])
  end
end
