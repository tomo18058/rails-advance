class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :require_admin_login, only: %i[new create]

  def new
  end

  def create
    email = session_params[:email]&.strip
    password = session_params[:password]

    if email.blank? || password.blank?
      flash.now[:alert] = "メールアドレスとパスワードを入力してください"
      render :new, status: :unprocessable_entity
      return
    end

    user = AdminUser.find_by(email: email)

    if user&.authenticate(password)
      session[:admin_user_id] = user.id
      redirect_to admin_events_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
