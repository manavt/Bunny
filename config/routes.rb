Rails.application.routes.draw do

get 'auth/facebook/callback', to: 'users#facebook'

  resources :products do
    collection do
      get "download_in_csv"
      get "download_in_json"
    end
  end
  resources :users do
    collection do
      get "login_page"
      post "sign_in"
      delete "logout"
    end
    member do
    end
  end
  namespace :api do
    resources :users do
      collection do
        put "v1authentication", format: "json"
      end
    end
  end
  resources :payments do
    collection do
        get 'braintree'
        post 'make_payment'
    end
  end
  root to: "users#login_page"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
