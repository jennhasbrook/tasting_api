Rails.application.routes.draw do

  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get '/wineries' => 'wineries#index'
    post 'wineries' => 'wineries#create'
    get '/wineries/:id' => 'wineries#show'
    patch '/wineries' => 'wineries#update'
    delete '/wineries/:id' => 'wineries#destroy'	

    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    get '/appointments' => 'appointments#index'
    post '/appointments' => 'appointments#create'
    get '/appointments/:id' => 'appointments#show' 
    patch'/appointments/:id' => 'appointments#update'
    delete '/appointments/:id' => 'appointments#destroy'

  end
  post 'user_token' => 'user_token#create'
end
