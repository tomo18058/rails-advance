Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: %i[new create destroy]
    resources :events
  end

  scope module: :public do
    resources :events, only: %i[index show]
  end

  # 必要なら（課題で指定があれば）
  root "public/events#index"
end
