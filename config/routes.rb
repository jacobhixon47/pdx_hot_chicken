Rails.application.routes.draw do
  get '/' => 'home#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
