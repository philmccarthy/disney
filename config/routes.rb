Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/resorts', to: 'resorts#create'
  post '/themeparks', to: 'theme_parks#create'
  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/themeparks', to: 'theme_parks#index'
  get '/themeparks/new', to: 'theme_parks#new'
  get '/themeparks/:id', to: 'theme_parks#show'
  get '/resorts/new', to: 'resorts#new'
  get '/resorts/:id', to: 'resorts#show'
end
