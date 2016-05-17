Rails.application.routes.draw do
  # get 'soundcloud/connect'
  # get 'soundcloud/connected'
  # get 'soundcloud/destroy'
  root :to => "welcome#index"

  get '/you',           :to => 'welcome#show',    :as => :you
  get '/you/update',    :to => 'welcome#update',  :as => :you_update

  get '/soundcloud/connect/:id',    :to => 'soundcloud#connect',    :as => :soundcloud_connect
  get '/soundcloud/connect/:id',    :to => 'soundcloud#connect',    :as => :soundcloud_connect_xhr
  get '/soundcloud/connected',  :to => 'soundcloud#connected',  :as => :soundcloud_connected
  get '/soundcloud/disconnect', :to => 'soundcloud#disconnect', :as => :soundcloud_disconnect

  post '/login'   => 'sessions#create'

  delete  '/logout' => 'sessions#destroy'

  get '/users/:id/pickings'   => 'pickings#index'

  post '/users/:user_id/pickings/:id'   => 'pickings#create'

  ### User roles ###

  get '/users/:id/roles' => 'users#my_roles'

  delete '/users/:id/roles' => 'artist_roles#destroy'

  post '/users/:user_id/roles/:id' => 'artist_roles#create'

  ### User search roles ###

  get '/users/:id/searched_roles' => 'users#searched_roles'

  delete '/users/:id/searched_roles' => 'searched_roles#destroy'

  post '/users/:user_id/searched_roles/:id' => 'searched_roles#create'

  ### User genres ###

  get '/users/:id/genres' => 'users#my_genres'

  delete '/users/:id/genres' => 'genre_selections#destroy'

  post '/users/:user_id/genres/:id' => 'genre_selections#create'

  ### User search genres ###

  get '/users/:id/searched_genres' => 'users#searched_genres'

  delete '/users/:id/searched_genres' => 'searched_genres#destroy'

  post '/users/:user_id/searched_genres/:id' => 'searched_genres#create'




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'users#index'

  get '/callback' => "users#callback"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :roles do
      resources :users
    end

    resources :users do
      resources :pickings
    end

    resources :genres do
      resources :users
    end

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
