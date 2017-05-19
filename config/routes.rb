Rails.application.routes.draw do
  resources :scores
  resources :whitecards
  resources :blackcards

  resources :players do
    collection do
      post '/login', to: 'players#login'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
