Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  root "pages#home"
  get "new", :to => "articles#new"
  get "about" , :to => "pages#about"
  get "signup", :to => "users#new"
  get "login", :to => "sessions#new"
  post "login", :to => "sessions#create"
  delete "logout", :to => "sessions#destroy"



  resources :categories, only: [:index,:show]
  resources :users, except: [:new]
  resources :articles #, only: [:show, :index, :new, :create, :edit, :update]

end
