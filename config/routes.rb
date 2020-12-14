Rails.application.routes.draw do
  # controller#action
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/placeholder', to: 'static_pages#placeholder'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  root 'static_pages#placeholder'
end
