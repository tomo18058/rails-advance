Rails.application.routes.draw do
  root "public/events#index"

  namespace :public do
    resources :events, only: %i[index show]
  end

  namespace :admin do
    resources :events
    resource :session, only: %i[new create destroy]
  end
end