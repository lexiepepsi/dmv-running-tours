require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'
  get 'welcome/index'
  get 'birthday_surprise/index'
  resources(:emails)
  # get 'emails/index'
end
