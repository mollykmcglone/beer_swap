Rails.application.routes.draw do
  devise_for :users,
                controllers: { registrations: "devise/registrations"}

  root :to => 'static_pages#home'

  get "/static_pages/:page" => "static_pages#show"

  resources :posts do
    resources :comments
  end

  resources :profiles do
    resources :beers
  end

  resources :beers, :only => [:index]

end
