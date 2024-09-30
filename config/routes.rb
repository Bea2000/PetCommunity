# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index', to: 'welcome#index', as: 'welcome_index'
  root 'welcome#index'

  get 'publications/search', to: 'publications#search', as: 'publications_search', format: :html
  # para cuando este listo
  # root :to 'publications#index'
  # resources :publications (?)

  ############################################################################

  # CREATE
  get 'publications/new', to: 'publications#new', as: 'publications_new'
  post 'publications', to: 'publications#create'

  get 'reviews/new', to: 'reviews#new', as: 'reviews_new'
  post 'reviews', to: 'reviews#create'

  get 'chats/new', to: 'chats#new', as: 'chats_new'
  post 'chats', to: 'chats#create'

  get 'comments/new', to: 'comments#new', as: 'comments_new'
  post 'comments', to: 'comments#create'

  get 'requests/new', to: 'requests#new', as: 'requests_new'
  post 'requests', to: 'requests#create'

  get 'messages/new', to: 'messages#new', as: 'messages_new'
  post 'messages', to: 'messages#create'
  ############################################################################

  # READ
  get 'publications/index', to: 'publications#index', as: 'publications_index'
  get 'publications/:id', to: 'publications#show', as: 'publications_show'

  get 'reviews/index', to: 'reviews#index', as: 'reviews_index'
  get 'reviews/:id', to: 'reviews#show', as: 'reviews_show'

  get 'chats/index', to: 'chats#index', as: 'chats_index'
  get 'chats/:id', to: 'chats#show', as: 'chats_show'

  get 'comments/index', to: 'comments#index', as: 'comments_index'
  get 'comments/:id', to: 'comments#show', as: 'comments_show'

  get 'requests/index', to: 'requests#index', as: 'requests_index'
  get 'requests/:id', to: 'requests#show', as: 'requests_show'

  get 'messages/index', to: 'messages#index', as: 'messages_index'
  get 'messages/:id', to: 'messages#show', as: 'messages_show'

  # get 'users/:id', to: 'users#show', as: 'users_show'

  ############################################################################

  # UPDATE
  get 'publications/:id/edit', to: 'publications#edit', as: 'publications_edit'
  patch 'publications/:id', to: 'publications#update', as: 'publications_update'

  get 'reviews/:id/edit', to: 'reviews#edit', as: 'reviews_edit'
  patch 'reviews/:id', to: 'reviews#update', as: 'reviews_update'

  get 'chats/:id/edit', to: 'chats#edit', as: 'chats_edit'
  patch 'chats/:id', to: 'chats#update', as: 'chats_update'

  get 'comments/:id/edit', to: 'comments#edit', as: 'comments_edit'
  patch 'comments/:id', to: 'comments#update', as: 'comments_update'

  get 'requests/:id/edit', to: 'requests#edit', as: 'requests_edit'
  patch 'requests/:id', to: 'requests#update', as: 'requests_update'

  get 'messages/:id/edit', to: 'messages#edit', as: 'messages_edit'
  patch 'messages/:id', to: 'messages#update', as: 'messages_update'

  ############################################################################

  # DELETE
  delete 'publications/:id', to: 'publications#delete', as: 'publications_delete'

  delete 'reviews/:id', to: 'reviews#delete', as: 'reviews_delete'

  delete 'chats/:id', to: 'chats#delete', as: 'chats_delete'

  delete 'comments/:id', to: 'comments#delete', as: 'comments_delete'

  delete 'requests/:id', to: 'requests#delete', as: 'requests_delete'

  delete 'messages/:id', to: 'messages#delete', as: 'messages_delete'
  ############################################################################

  # DEVISE
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users, only: [:show]
  delete 'users/:id', to: 'users#destroy', as: 'admin_destroy_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
