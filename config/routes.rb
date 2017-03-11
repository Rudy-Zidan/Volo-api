Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players
  post '/players/update_score', to: 'players#update_score'
  post '/rank', to: 'rank#index'

end
