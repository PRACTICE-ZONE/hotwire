Rails.application.routes.draw do
  get 'line_items/new'
  get 'line_items/edit'
  get 'line_items/create'
  get 'line_items/destroy'
  resources :posts
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  resources :quotes do
    resources :line_item_dates, except: [:index, :show] do 
      resources :line_items, except: [:index, :show]
    end
  end
end
