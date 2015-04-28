Rails.application.routes.draw do
  # set route to root directory
  root to: 'todos#index'

   # to be extra RESTful
  get '/todos', to: 'todos#index'

  # set route to create page
  # get 'todos/create', to: 'todos#create'

  # handle submitted form
  post '/', to: 'todos#create'

  # mark item completed
  match '/todos/complete', to: 'todos#complete', :via => :post

  # get selected item to delete
  get '/todos/:id/delete', to: 'todos#destroy', as: :delete_todos

  # delete selected item
  delete '/todos/:id/delete', to: 'todos#destroy'

  # get completed items to delete
  get '/todos/delete', to: 'todos#destroy_complete', as: :delete_complete_todos

  # delete completed items
  delete '/todos/delete', to: 'todos#destroy_complete'

  # show edit paeg with selected item to edit
  get '/todos/:id/edit', to: 'todos#edit', as: :edit_todos

  # update edited item
  patch '/todos/:id', to: 'todos#update', as: :todo

  get '/authors', to: 'authors#index'

  post '/authors', to: 'authors#create'
end
