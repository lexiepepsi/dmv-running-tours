require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'
  get 'welcome/index'
  get 'birthday_surprise/index'
  resources(:emails)
  # get 'emails/index'

  resources :runs, only: [:index]
  post 'runs/upload', to: 'runs#upload'
  post 'runs/upload_slow', to: 'runs#upload_slow'
  post 'runs/destroy', to: 'runs#destroy_all'
end
