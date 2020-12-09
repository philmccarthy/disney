Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  delete '/themeparks/:id', to: 'theme_parks#destroy'
  post '/themeparks', to: 'theme_parks#create'
  patch '/themeparks/:id', to: 'theme_parks#update'
  get '/themeparks', to: 'theme_parks#index'
  get '/themeparks/new', to: 'theme_parks#new'
  get '/themeparks/:id', to: 'theme_parks#show'
  get '/themeparks/:id/rides', to: 'theme_parks#rides'
  get '/themeparks/:id/edit', to: 'theme_parks#edit'

  delete '/rides/:id', to: 'rides#destroy'
  patch '/rides/:id', to: 'rides#update'
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'
  get '/rides/:id/edit', to: 'rides#edit'

  delete '/resorts/:id', to: 'resorts#destroy'
  post '/resorts', to: 'resorts#create'
  get '/resorts', to: 'resorts#index'
  get '/resorts/:id/vacationers', to: 'resorts#vacationers'
  get '/resorts/new', to: 'resorts#new'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:id/edit', to: 'resorts#edit'
  patch '/resorts/:id', to: 'resorts#update'

  get '/vacationers', to: 'vacationers#index'
  get '/vacationers/:id', to: 'vacationers#show'
  get '/vacationers/:id/edit', to: 'vacationers#edit'
  patch '/vacationers/:id', to: 'vacationers#update'
  delete '/vacationers/:id', to: 'vacationers#destroy'

  get '/resorts/:id/vacationers/new', to: 'resorts_vacationers#new'
  post '/resorts/:id/vacationers', to: 'resorts_vacationers#create'
  
  get '/themeparks/:id/rides/new', to: 'theme_parks_rides#new'
  post '/themeparks/:id/rides', to: 'theme_parks_rides#create'
end
