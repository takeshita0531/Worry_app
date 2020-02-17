Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
    :sessions => "users/sessions",
    :passwords => "users/passwords",
      }
  post "comments/create" => "comments#create"
  get "comments/:id/destroy" => "comments#destroy"
 
 get "users/index" => "users#index"
 get "users/new" => "users#new"
 get "users/:id" => "users#show"
 post "users/create" => "users#create"
 get "users/:id/edit" => "users#edit"
 post "users/:id/update" => "users#update"
 
  get "worry/index" => "worry#index"
  get "worry/new" => "worry#new"
  get "worry/:id" => "worry#show"
 post "worry/create" => "worry#create" 
  get "worry/:id/edit" => "worry#edit"
 post "worry/:id/update" => "worry#update"
 get "worry/:id/destroy" => "worry#destroy"
  
  get "comments/:id/destroy" => "comments#destroy"
    
  
       
  root to: "home#top"
  get "signup" => "home#signup"
  
  
  
  
  devise_scope :user do
   
    get '/users/sign_out' => 'devise/sessions#destroy'
    
  
  end
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
