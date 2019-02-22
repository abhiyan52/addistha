Rails.application.routes.draw do
  get 'slot_items/index'
  get 'slot_items/show'
  get 'slot_items/list'
  get 'slot_items/agent_slots_list'
  post 'slot_items/create'
  get 'bids/index'
  get 'bids/show'
  get 'bids/delete'
  get 'bids/update'
  get 'bids/edit'
  get 'advertisements/sell'
  get 'index/extrainfo'
  post 'index/extrainfo'
  get 'slot_items/index'
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
