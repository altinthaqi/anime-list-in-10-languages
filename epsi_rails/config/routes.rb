Rails.application.routes.draw do
  root "animes#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :animes
end
