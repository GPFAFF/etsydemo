Rails.application.routes.draw do
  devise_for :users
  resources :listings do
    resources :orders, only: %i[new create]
  end
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => 'listings#seller'
  get 'sales' => 'orders#sales'
  get 'purchases' => 'orders#purchases'

  get '/card/new' => 'billing#new_card', as: :add_payment_method

  get 'billing' => 'billing#index', as: :billing
  post "/card" => "billing#create_card", as: :create_payment_method

  root 'listings#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
