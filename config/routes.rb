Rails.application.routes.draw do
  devise_for :users
  root 'article#index'
end
