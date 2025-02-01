Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :comments

  # Sirve para personalizar las rutas que usa la gema devise para un modelo particular (user en este caso)
  # Cada get sirve para crear una ruta adicional de las que nos da devise para estas tareas específicas
  # En este caso, se añaden rutas para el registro, inicio de sesión y cierre de sesión de un usuario
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/passwords', to: 'devise/passwords#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  resources :users, only: [:show]

  get 'home/about'
  get 'posts/myposts'
  resources :posts

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Definimos la pagina de post como la ruta principal de la aplicación
  root "posts#index"
end
