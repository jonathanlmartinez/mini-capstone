Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "products#index"
  get "/home" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"

  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

 # get "/" => "products#index"
  # get "/home" => "products#index"
  get "/supplier/new" => "suppliers#new"
  post "/supplier" => "suppliers#create"
  # get "/suppliers" => "products#index"
  # get "/products/:id" => "products#show"

  get "/supplier/:id/edit" => "supplier#edit"
  patch "/supplier/:id" => "supplier#update"
  delete "/supplier/:id" => "supplier#destroy"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
