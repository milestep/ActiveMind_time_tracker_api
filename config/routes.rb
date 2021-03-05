Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  scope :api do
    resources :notes
    resources :categories
    resources :projects
    # post 'signup', to: 'users#create'
    post 'signin', to: "users#login"
    # get "auto_login", to: "users#auto_login"
  end
end
