Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teams, only: [:index]
  resources :competitions, only: [:show]
  resources :competition_teams, only: [:create]
end
