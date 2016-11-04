Rails.application.routes.draw do
  devise_for :users,
                controllers: { registrations: "devise/registrations"}

  root :to => 'static_pages#home'

  get "/static_pages/:page" => "static_pages#show"

  resources :posts do
    resources :comments
  end

  resources :profiles

  resources :users do
    resources :beers
  end

  resources :beers do
    resources :conversations
  end

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  resources :messages, only: [:new, :create]

  resources :conversations do
   member do
     post :reply
     post :trash
     post :untrash
   end
  end
end
