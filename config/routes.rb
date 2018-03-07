Rails.application.routes.draw do
  get '/all-products' => 'products#show_products'
  get '/bike' => 'products#bike'
  get '/skateboard' => 'products#skateboard'
  get '/scooter' => 'products#scooter'
end