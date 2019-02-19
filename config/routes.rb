Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "index#index"
    get 'login', action: "login", controller: 'index'
    get "index/logout"
    get "index/signup"
    post "login", action: "login", controller: 'index'
    post "index/signup"
end
