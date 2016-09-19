Rails.application.routes.draw do
   
    devise_for :users
    #root 'articles#index'
     #root 'articles#image'
    root 'welcome#index'
    #get 'articles/index'
    resources :articles do
    	resources :comments	
    end
   	#get '/image' => 'articles#image'
    
end

