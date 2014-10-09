Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  root "galleries#index"

  resources :users, only: [:new, :create, :index, :show]

  resources :comments, only: [:create]

  resources :galleries do
    resources :images, only: [:show, :new, :create, :edit, :update]
  end

  resources :images, only: [] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy, :edit, :update]
  end

  resources :groups, only: [:index, :new, :create, :show] do
    resources :group_memberships, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :create, :show]
   
 # get "/" => "galleries#index"
 # get "/galleries/new" => "galleries#new"
 # post "/galleries" => "galleries#create"
 # get "/galleries/:id" => "galleries#show"
 # get "/galleries/:id/edit" => "galleries#edit"
 # patch "/galleries/:id" => "galleries#update"
 # delete "/galleries/:id" => "galleries#destroy"
end
