Blackjack::Application.routes.draw do
  
  root :to => "blackjack#index"

  get '/blackjack', to: 'blackjack#index', as: 'blackjack'


end
