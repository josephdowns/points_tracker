Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/user_points", to: 'user_points#create'
      get "/user_points", to: 'user_points#index'
      patch "/user_points", to: 'user_points#update'
    end
  end
end
