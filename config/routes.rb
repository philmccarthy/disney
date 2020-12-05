Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  delete '/resorts/:id', to: 'resorts#destroy'
  delete '/themeparks/:id', to: 'theme_parks#destroy'
  delete '/rides/:id', to: 'rides#destroy'
  post '/resorts', to: 'resorts#create'
  post '/themeparks', to: 'theme_parks#create'
  patch '/themeparks/:id', to: 'theme_parks#update'
  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/themeparks', to: 'theme_parks#index'
  get '/themeparks/new', to: 'theme_parks#new'
  get '/themeparks/:id', to: 'theme_parks#show'
  get '/themeparks/:id/rides', to: 'theme_parks#rides'
  get '/themeparks/:id/rides/new', to: 'theme_parks#new_ride'
  post '/themeparks/:id/rides', to: 'theme_parks#create_ride'
  get '/themeparks/:id/edit', to: 'theme_parks#edit'
  get '/resorts/new', to: 'resorts#new'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:id/edit', to: 'resorts#edit'
  patch '/resorts/:id', to: 'resorts#update'
  patch '/rides/:id', to: 'rides#update'
  get '/rides', to: 'rides#index'
  get '/rides/:id', to: 'rides#show'
  get '/rides/:id/edit', to: 'rides#edit'
  get '/vacationers', to: 'vacationers#index'
  get '/resorts/:id/vacationers', to: 'resorts#vacationers'
  get '/vacationers/:id', to: 'vacationers#show'
  get '/resorts/:id/vacationers/new', to: 'resorts#new_vacationer'
  post '/resorts/:id/vacationers', to: 'resorts#create_vacationer'
  get '/vacationers/:id/edit', to: 'vacationers#edit'
  patch '/vacationers/:id', to: 'vacationers#update'
end
