ExampleApp::Application.routes.draw do
  root 'static_pages#home'

  get  '/about'        => 'static_pages#about'
  get  '/login'        => 'sessions#login'
  get  '/logout'       => 'sessions#logout'
  get  '/warning/:id'  => 'users#warn', as: "warn"
  post '/login'        => 'sessions#create'

  resources :users
  resources :microposts
end
