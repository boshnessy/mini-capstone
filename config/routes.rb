Rails.application.routes.draw do
  get '/products' => 'products#transportation_products'
  get '/all_products' => 'products#show_products'
end
