Rails.application.routes.draw do
  namespace :v1 do
    get '/all-products' => 'products#show_products'
    get '/bike' => 'products#bike'
    get '/skateboard' => 'products#skateboard'
    get '/scooter' => 'products#scooter'
  end

  namespace :v2 do
    get '/all-products' => 'products#show_products'
    get '/bike' => 'products#bike'
    get '/skateboard' => 'products#skateboard'
    get '/scooter' => 'products#scooter'
  end
end