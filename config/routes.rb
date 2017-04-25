Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :videos

  get '/users/:id/folders/new' => 'folders#new', as: :new_folder
  get '/users/:id/folders/:folderid/edit' => 'folders#edit', as: :edit_folder
  get '/users/:id/folders/:folderid' => 'folders#show', as: :folder
  patch '/users/:id/folders/:folderid' => 'folders#update'
  post '/folders' => 'folders#create', as: :folders

  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
end

# Prefix Verb   URI Pattern                Controller#Action
#   root GET    /                          users#index
#  users GET    /users(.:format)           users#index
#        POST   /users(.:format)           users#create
# new_user GET    /users/new(.:format)       users#new
# edit_user GET    /users/:id/edit(.:format)  users#edit
#   user GET    /users/:id(.:format)       users#show
#        PATCH  /users/:id(.:format)       users#update
#        PUT    /users/:id(.:format)       users#update
#        DELETE /users/:id(.:format)       users#destroy
# videos GET    /videos(.:format)          videos#index
#        POST   /videos(.:format)          videos#create
# new_video GET    /videos/new(.:format)      videos#new
# edit_video GET    /videos/:id/edit(.:format) videos#edit
#  video GET    /videos/:id(.:format)      videos#show
#        PATCH  /videos/:id(.:format)      videos#update
#        PUT    /videos/:id(.:format)      videos#update
#        DELETE /videos/:id(.:format)      videos#destroy
# logout DELETE /logout(.:format)          sessions#destroy
# sessions POST   /sessions(.:format)        sessions#create
# new_session GET    /sessions/new(.:format)    sessions#new
