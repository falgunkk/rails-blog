Rails.application.routes.draw do
   
    devise_for :users
  resources :userlist
    #root 'articles#index'
     #root 'articles#image'
    root 'welcome#index'
    #get 'articles/index'
    resources :articles do
    	resources :comments	
    end
   	#get '/image' => 'articles#image'
   	#get '/userlist' =>'userlist#index'
   	#get '/k', to: 'userlists#index'
   	#root 'userlists#index'
      #match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
     #get '/users/:id',  => 'users#show', :as => :user


    
end

