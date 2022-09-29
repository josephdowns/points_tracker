Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/user_points", to: 'user_points#create'
      get "/user_points", to: 'user_points#index'
    end
  end
end
