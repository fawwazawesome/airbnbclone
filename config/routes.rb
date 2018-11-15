Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
	root "welcome#show"
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"


	resources :users
  get "/search" => "listings#search", as: "search"
	resources :listings do
  	resources :reservations
	end

  resources :reservations, only: [:show] do
    get 'braintree/new'
    post 'braintree/checkout'
  end

end