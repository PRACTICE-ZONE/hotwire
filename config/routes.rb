Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :articles
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do 
      resources :line_items, except: [:index, :show]
    end
  end
end
