Rails.application.routes.draw do
  get 'bids/index'
  get 'bids/show'
  get 'bids/delete'
  get 'bids/update'
  get 'bids/edit'
  resources :agents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "index#index"
    get 'login', action: "login", controller: 'index'
    get "index/logout"
    get "index/signup"
    post "login", action: "login", controller: 'index'
    post "index/signup"
    get "index/profile"

    resources :bids do 
      member do 
        get :delete 
      end 
    end
    resources :advertisements do 
      member do 
        get :delete 
      end
    end
    
end
