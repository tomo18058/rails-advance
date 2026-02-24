class Admin::ApplicationController < ApplicationController
  before_action :require_admin_login

  private

  def require_admin_login
    return if session[:admin_user_id].present?
    redirect_to new_admin_session_path, alert: "ログインしてください"
  end
end