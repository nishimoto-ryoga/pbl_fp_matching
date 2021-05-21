Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#top"
  get "/top_fp" => "home#top_fp"
  
  devise_for :planners
  resources :planners, only: [:index, :show] do
    get :mypage, on: :collection
  end

  devise_for :clients
  resources :clients, only: [:edit] do
    get :mypage, on: :collection
  end
  resources :reservation_frames, only: [:new, :create]
end
