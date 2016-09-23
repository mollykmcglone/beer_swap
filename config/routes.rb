Rails.application.routes.draw do
  devise_for :users,
                controllers: { registrations: "devise/registrations"}

  root :to => 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :profiles do
    resources :beers
  end

end
