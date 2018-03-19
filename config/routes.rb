Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  
  root 'presentation#index'

  resources :slides, only: :show, param: :view
  resources :presentation, only: :index

  concern :shared_routes do
    resources :destroyed_playlist_items, only: :update
    resources :posters, only: :index
    resources :playlists, only: %i[index create show update destroy] do
      resources :playlist_items, only: %i[create update destroy]
    end
  end

  namespace :default do
    concerns :shared_routes
  end

  namespace :create do
    concerns :shared_routes
  end

  namespace :destroy do
    concerns :shared_routes
  end

  namespace :update do
    concerns :shared_routes
  end

  namespace :undo do
    concerns :shared_routes
  end

  namespace :copy do
    concerns :shared_routes
  end

  namespace :reorder do
    concerns :shared_routes
  end

  namespace :final do
    concerns :shared_routes
  end
end
