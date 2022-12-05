Rails.application.routes.draw do

  root "welcome#index"
  get "/welcome", to: "welcome#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  namespace :api do
    namespace :v1 do
      namespace :users do
        resources :students
        resources :courses
          get '/search', to: 'students#search'
      end
    end
  end

  resources :courses
  resources :students
end


  
