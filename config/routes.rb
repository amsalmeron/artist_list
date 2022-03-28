Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id', to: 'artists#show'
  post '/artists', to: 'artists#create'
  get '/artists/:id/edit', to: 'artists#edit'
  patch '/artists/:id', to: 'artists#update'
  delete '/artists/:id', to: 'artists#destroy'


  get '/paintings', to: 'paintings#index'
  get '/paintings/:id', to: 'paintings#show'
  get '/paintings/:id/edit', to: 'paintings#edit'
  patch '/paintings/:id', to: 'paintings#update'
  delete '/paintings/:id', to: 'paintings#destroy'


  get '/artists/:id/paintings', to: 'artists_paintings#index'
  get '/artists/:id/paintings/new', to: 'artists_paintings#new'
  post '/artists/:id/paintings', to: 'artists_paintings#create'

end
