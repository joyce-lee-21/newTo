Rails.application.routes.draw do
  resources :secondary_categories, only: [:index]
  resources :primary_categories, only: [:index] #used
  
  resources :saved_venues, only: [:index, :create, :destroy]
  resources :category_selections, only: [:index, :update, :create] #used
  resources :city_profiles, only: [:index, :show, :update, :create]

  # Signup, update account information
  resources :users, only: [:index, :show, :update, :create]

  # User login
  post '/login', to: 'sessions#create' #used
  # get '/me', to: "users#show"
  get '/logged_in', to: 'sessions#is_logged_in?'

  # User logout
  post '/logout', to: 'sessions#destroy' #used

  # Search for categories - may need to change the url from profile_select to model name
  get '/categories/:query', to: 'primary_categories#categoryshow'
  # get '/profile_select/:query', to: 'secondary_categories#categoryshow'

  # Load more categories
  # get '/categories/list/:first&:last', to: 'secondary_categories#categoryparse'
  get '/categories/list/:first&:last', to: 'primary_categories#categoryparse' #used

  # Delete category selections from profile
  delete '/category_selections/profile=:id', to: 'category_selections#destroy'

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Prefix Verb   URI Pattern                                                                                       Controller#Action
# secondary_categories GET    /secondary_categories(.:format)                                                                   secondary_categories#index
#   primary_categories GET    /primary_categories(.:format)                                                                     primary_categories#index
#         saved_venues GET    /saved_venues(.:format)                                                                           saved_venues#index
#                      POST   /saved_venues(.:format)                                                                           saved_venues#create
#          saved_venue DELETE /saved_venues/:id(.:format)                                                                       saved_venues#destroy
#  category_selections GET    /category_selections(.:format)                                                                    category_selections#index
#                      POST   /category_selections(.:format)                                                                    category_selections#create
#   category_selection PATCH  /category_selections/:id(.:format)                                                                category_selections#update
#                      PUT    /category_selections/:id(.:format)                                                                category_selections#update
#        city_profiles GET    /city_profiles(.:format)                                                                          city_profiles#index
#                      POST   /city_profiles(.:format)                                                                          city_profiles#create
#         city_profile GET    /city_profiles/:id(.:format)                                                                      city_profiles#show
#                      PATCH  /city_profiles/:id(.:format)                                                                      city_profiles#update
#                      PUT    /city_profiles/:id(.:format)                                                                      city_profiles#update
#                users GET    /users(.:format)                                                                                  users#index
#                      POST   /users(.:format)                                                                                  users#create
#                 user GET    /users/:id(.:format)                                                                              users#show
#                      PATCH  /users/:id(.:format)                                                                              users#update
#                      PUT    /users/:id(.:format)                                                                              users#update
#                login POST   /login(.:format)                                                                                  sessions#create
#                   me GET    /me(.:format)                                                                                     users#show
#               logout DELETE /logout(.:format)                                                                                 sessions#destroy
#                      GET    /categories/:query(.:format)                                                                      primary_categories#categoryshow
#                      GET    /categories/list/:first&:last(.:format)                                                           secondary_categories#categoryparse