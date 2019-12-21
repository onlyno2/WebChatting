Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :auth do
      post "/register", to: "auth#register"
      post "/login", to: "auth#login"
      post "/facebook_login", to: "facebook#login"
      get "/test", to: "auth#test"
    end

    # resource users api
    resources :users
    # resource posts api
    resources :posts
<<<<<<< 6cedf02dcaf989d9093aec98f0fdc7edac88e15c
    # resource likes api
    resources :likes, only: %i[create destroy]
    # resource image api
    resources :images, only: %i[create]
=======
    # contact
    post "/contact", to:"static_pages#contact"
>>>>>>> NavBar and ContactMailing
  end
end
