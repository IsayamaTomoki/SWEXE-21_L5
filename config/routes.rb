Rails.application.routes.draw do
    resources :users, :tweets, :likes
    root 'tweets#index'
    get 'top/main', to: 'top#main'
    post 'top/login'
    get 'top/logout'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
