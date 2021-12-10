Rails.application.routes.draw do
  root :to => "categories#index"
  resources :matches
  resources :recipes
  resources :categories
  devise_for :chefs
  resources :chefs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
