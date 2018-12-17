Rails.application.routes.draw do
  root to: 'pages#index'
  get '/dashboard', to: 'pages#dashboard'
  get '/users/:id/watch_list', to: 'users_contents#index',
                               as: 'users_watch_list'

  get '/users/:id/change_role', to: 'users#change_role',
                                as: 'user_change_role'

  devise_for :users, skip: [:registrations]

  resources :users
  resources :contents

  get 'contents/:id/add_favorite', to: 'users_contents#add_favorite',
                                   as: 'add_favorite'
  get 'contents/:id/remove_favorite', to: 'users_contents#remove_favorite',
                                      as: 'remove_favorite'
  get 'contents/:id/add_rating', to: 'users_contents#add_rating',
                                 as: 'add_rating'
  get 'contents/:id/add_watch_list', to: 'users_contents#add_watch_list',
                                     as: 'add_watch_list'
  get 'contents/:id/remove_watch_list', to: 'users_contents#remove_watch_list',
                                        as: 'remove_watch_list'
end
