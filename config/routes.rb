Rails.application.routes.draw do
  resources :secondary_categories, only: [:index]
  resources :primary_categories, only: [:index]
  resources :saved_venues, only: [:index, :create, :destroy]
  resources :category_selections, only: [:index, :update, :create]
  resources :city_profiles, only: [:index, :show, :update, :create]
  resources :users, only: [:index, :show, :update, :create]

  # Search for categories - may need to change the url from profile_select to model name
  get '/categories/:query', to: 'primary_categories#categoryshow'
  # get '/profile_select/:query', to: 'secondary_categories#categoryshow'

  # Load more categories
  get '/categories/list/:first&:last', to: 'secondary_categories#categoryparse'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
