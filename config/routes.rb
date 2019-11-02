Rails.application.routes.draw do
  get 'welcome/index'
  get 'birthday_surprise/index'
  root 'welcome#index'
end
