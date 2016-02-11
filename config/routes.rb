Rails.application.routes.draw do
  devise_for :users

  # get '/' => 'locations#index'
  get '/brands/:brand_id/locations' => 'locations#index', as: 'brand_location'
  get '/brands' => 'brands#index', as: 'brand'

  get '/brands/:brand_id/locations/new' => 'locations#new', as: 'brand_location_new'
  get '/brands/new' => 'brands#new'

  post '/brands/:brand_id/locations' => 'locations#create'
  post '/brands' => 'brands#create'

  get '/brands/:brand_id/locations/:id' => 'locations#show', as: 'brand_location_show'
  get '/brands/:id' => 'brands#show'

  get '/brands/:brand_id/locations/:id/edit' => 'locations#edit', as: 'brand_location_edit'
  get '/brands/:id/edit' => 'brands#edit'

  patch '/brands/:brand_id/locations/:id' => 'locations#update', as: 'brand_location_update'
  patch '/brands/:id' => 'brands#update', as: 'brand_update'

  delete '/brands/:brand_id/locations/:id' => 'locations#destroy', as: 'brand_location_delete'
  delete '/brands/:id' => 'brands#destroy'

  post '/brands/:brand_id/search' => 'locations#search', as: 'brand_location_search'

  #static pages
  root "pages#show", page: "home", as: 'home'
  get "/*page" => "pages#show"
end
