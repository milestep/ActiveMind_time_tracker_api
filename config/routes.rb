Rails.application.routes.draw do
  # root to: 'application#index'
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # begin
  #   ActiveAdmin.routes(self)
  # rescue Exception => e
  #   puts "ActiveAdmin: #{e.class}: #{e}"
  # end
  scope :api do
    resources :notes
    resources :categories
    resources :projects
    # post 'signup', to: 'users#create'
    post 'signin', to: "users#login"
    get "users", to: "users#index"
  end
end
