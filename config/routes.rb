Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end
  scope :api do
    resources :notes
    resources :categories
    resources :projects
    resources :users
    put 'setup/:id', to: 'users#update'
    # post 'signup', to: 'users#create'
    post 'signin', to: "users#login"
  end
end
