Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  delete '/resorts/:id', to: 'resorts#destroy'
  delete '/themeparks/:id', to: 'theme_parks#destroy'
  post '/resorts', to: 'resorts#create'
  post '/themeparks', to: 'theme_parks#create'
  patch '/themeparks/:id', to: 'theme_parks#update'
  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/themeparks', to: 'theme_parks#index'
  get '/themeparks/new', to: 'theme_parks#new'
  get '/themeparks/:id', to: 'theme_parks#show'
  get '/themeparks/:id/edit', to: 'theme_parks#edit'
  get '/resorts/new', to: 'resorts#new'
  get '/resorts/:id', to: 'resorts#show'
  get '/resorts/:id/edit', to: 'resorts#edit'
  patch '/resorts/:id', to: 'resorts#update'
end
