Rails.application.routes.draw do
  # 公開側
  namespace :public do
    resources :events, only: %i[index show]
  end

  # 管理側（ログイン）
  namespace :admin do
    resource  :session, only: %i[new create destroy]
    resources :events
  end

  # ルートは公開一覧に
  root "admin/events#index"
end