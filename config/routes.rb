ExampleApp::Application.routes.draw do
  root 'static_pages#home'

  get '/about' => 'static_pages#about'
  
  resources :users
  resources :microposts
end
