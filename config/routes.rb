Rails.application.routes.draw do
  get 'advertisements/index'
  get 'advertisements/new'
  get 'advertisements/create'
  get 'advertisements/delete'
  get 'advertisements/edit'
  get 'advertisements/update'
  get 'advertisements/show'
  get 'advertisements/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "index#index"
    get 'login', action: "login", controller: 'index'
    get "index/logout"
    get "index/signup"
    post "login", action: "login", controller: 'index'
    post "index/signup"
    get "index/profile"
    resources :advertisements do 
      member do 
        get :delete 
      end
    end
end
