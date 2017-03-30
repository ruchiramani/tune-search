Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "search#new"
  resources :search, :artists, :songs, :albums
  post '/search/general', to: 'search#general'
  post '/search/term', to: 'search#term'

end
