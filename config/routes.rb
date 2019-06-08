Rails.application.routes.draw do

  get '/jobs/:status', to:'jobs#show'

end
