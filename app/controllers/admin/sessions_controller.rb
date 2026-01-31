class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_admin_login, only: %i[new create]

  def new
  end

  def create
    Rails.logger.debug "PARAMS=#{params.to_unsafe_h}"
    user = AdminUser.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_events_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_user_id)
    redirect_to new_admin_session_path, notice: "ログアウトしました"
  end
end
