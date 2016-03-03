Rails.application.routes.draw do
  devise_for :users

  # get '/' => 'locations#index'
  get '/brands/:brand_id/locations' => 'locations#index', as: 'brand_location'
  get '/brands/:brand_id/contents' => 'contents#index', as: 'brand_content'
  get '/brands/:brand_id/images' => 'images#index', as: 'brand_image'
  get '/brands' => 'brands#index', as: 'brand'

  get '/brands/:brand_id/locations/new' => 'locations#new', as: 'brand_location_new'
  get '/brands/:brand_id/contents/new' => 'contents#new', as: 'brand_content_new'
  get '/brands/:brand_id/images/new' => 'images#new', as: 'brand_image_new'
  get '/brands/new' => 'brands#new'

  post '/brands/:brand_id/locations' => 'locations#create'
  post '/brands/:brand_id/contents' => 'contents#create'
  post '/brands/:brand_id/images' => 'images#create'
  post '/brands' => 'brands#create'

  post '/brands/:brand_id/locations/:id/send_mail' => 'locations#send_mail', as: 'send_mail'

  get '/brands/:brand_id/locations/:id' => 'locations#show', as: 'brand_location_show'
  get '/brands/:brand_id/contents/:id' => 'contents#show', as: 'brand_content_show'
  get '/brands/:brand_id/images/:id' => 'images#show', as: 'brand_image_show'
  get '/brands/:id' => 'brands#show'

  get '/brands/:brand_id/locations/:id/edit' => 'locations#edit', as: 'brand_location_edit'
  get '/brands/:brand_id/contents/:id/edit' => 'contents#edit', as: 'brand_content_edit'
  get '/brands/:brand_id/images/:id/edit' => 'images#edit', as: 'brand_image_edit'
  get '/brands/:id/edit' => 'brands#edit', as: 'brand_edit'

  patch '/brands/:brand_id/locations/:id' => 'locations#update', as: 'brand_location_update'
  patch '/brands/:brand_id/contents/:id' => 'contents#update', as: 'brand_content_update'
  patch '/brands/:brand_id/images/:id' => 'images#update', as: 'brand_image_update'
  patch '/brands/:id' => 'brands#update', as: 'brand_update'

  delete '/brands/:brand_id/locations/:id' => 'locations#destroy', as: 'brand_location_delete'
  delete '/brands/:brand_id/contents/:id' => 'contents#destroy', as: 'brand_content_delete'
  delete '/brands/:brand_id/images/:id' => 'images#destroy', as: 'brand_image_delete'
  delete '/brands/:id' => 'brands#destroy'

  #static pages
  root "pages#show", page: "home", as: 'home'
  get "/*page" => "pages#show"
end