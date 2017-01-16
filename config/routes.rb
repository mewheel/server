Rails.application.routes.draw do
  post 'login' => 'auth#login'
  post 'signup' => 'auth#signup'
  resources :reflections
  resources :activities
  resources :actions
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
