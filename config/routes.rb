Rails.application.routes.draw do

  # get route with a specific status -"Applied/New/Interviewed"
  get '/jobs/:status', to:'jobs#show'

  # post route for creating a new job
  post '/jobs', to: 'jobs#create'

  # update route to update status -"Applied/New/Interviewed"
  put '/jobs/:id', to: 'jobs#update'

  # delete route to delete a job"
  delete '/jobs/:id', to: 'jobs#delete'

end
