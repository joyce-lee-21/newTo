Rails.application.routes.draw do
  # User login
  post "/login", to: "auth#login"

  # User auto login
  get "/auto_login", to: "auth#auto_login"

  # Toggle between load more and back across secondary categories
  get '/categories/list/:primary_category/:first&:last', to: 'secondary_categories#categoryparse'

  # Randomly select 3 categories from SecondaryCategory
  get '/secondary_categories/randomize', to: 'secondary_categories#randomize'

  resources :secondary_categories, only: [:index]
  resources :primary_categories, only: [:index]
  
  resources :saved_venues, only: [:create, :update, :destroy]
  resources :category_selections, only: [:create, :destroy]
  resources :city_profiles, only: [:show, :create, :destroy]
  resources :users, only: [:update, :create]

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end