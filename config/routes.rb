Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/resorts', to: 'resorts#index'
  get '/themeparks', to: 'theme_parks#index'
  get '/themeparks/:id', to: 'theme_parks#show'
end
