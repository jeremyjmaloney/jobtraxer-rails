Rails.application.routes.draw do

  get '/jobs/:status', to:'jobs#show'
  post '/jobs', to: 'jobs#create'
  put '/jobs/:id', to: 'jobs#update'
  delete '/jobs/:id', to: 'jobs#delete'

end
