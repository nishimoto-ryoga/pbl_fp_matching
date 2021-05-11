Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :clients
  root "home#top"
  get "/top_fp" => "home#top_fp"
  
  devise_for :planners
  resources :planners, only: [:show, :edit]
end
