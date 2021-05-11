Rails.application.routes.draw do
  get 'planners/show'
  get 'planners/edit'
  devise_for :planners
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :clients
  root "home#top"
  get "/top_fp" => "home#top_fp"
end
