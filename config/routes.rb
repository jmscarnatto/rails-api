Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:create]
      resources :tokens, only: [:create]
      resources :clients, defaults: { format: "json" }
      get 'clientes/page/:page(/per/:per)', to: 'clients#index'
      resources :employees, defaults: { format: "json" }
      get 'employees/page/:page(/per/:per)', to: 'employees#index'
      resources :projects, defaults: { format: "json" }
      get 'projects/page/:page(/per/:per)', to: 'projects#index'
      resources :countries, defaults: { format: "json" }
      get 'countries/page/:page(/per/:per)', to: 'countries#index'
      resources :roles, defaults: { format: "json" }
      get 'roles/page/:page(/per/:per)', to: 'roles#index'
      post '/*path/:id', to: 'employees#route_failure'
      put '/*path/', to: 'employees#route_failure'
      delete '/*path/', to: 'employees#route_failure'
    end
  end
end
