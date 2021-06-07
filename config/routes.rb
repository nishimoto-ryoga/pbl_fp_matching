Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#top'
  get '/top_fp' => 'home#top_fp'

  devise_for :planners
  resources :planners, only: %i[index show edit update] do
    get :mypage, on: :collection
  end

  devise_for :clients
  resources :clients, only: %i[edit update] do
    get :mypage, on: :collection
  end

  get '/reservation_frames' => 'reservation_frames#new'
  resources :reservation_frames, only: %i[show new create destroy] do
    resource :reservations, only: :new
  end
  resources :reservations, only: %i[create destroy]
end
