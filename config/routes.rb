Rails.application.routes.draw do
  root 'savedsearches#index'

  resources :savedsearches, only: [:index, :create]
end
