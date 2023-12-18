Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do 
    member do
      get :users_list_member
    end

    collection do
      get :friends_list_collection
    end
  end
end
