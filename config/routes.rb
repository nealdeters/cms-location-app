Rails.application.routes.draw do
  devise_for :users

  # get '/' => 'locations#index'
  get '/locations' => 'locations#index', as: 'location'

  get '/locations/new' => 'locations#new', as: 'location_new'

  post '/locations' => 'locations#create', as: 'location_create'

  get '/locations/:id' => 'locations#show', as: 'location_show'

  get '/locations/:id/edit' => 'locations#edit', as: 'location_edit'

  patch '/locations/:id' => 'locations#update', as: 'location_update'

  delete '/locations/:id' => 'locations#destroy', as: 'location_destroy'

  post '/search' => 'locations#search', as: 'location_search'

  #static pages
  root "pages#show", page: "home", as: 'home'
  get "/*page" => "pages#show"
end
