Rails.application.routes.draw do
  
  #admin index
  get 'admin/index', to: 'admin#index', as: 'admin'
  get 'admin/show_bikes/:bike_type', to: 'admin#show_bikes', as: 'admin_show_bikes'
  get 'admin/show_bike_rentals/:user_type', to: 'admin#show_bike_rentals', as: 'admin_show_bike_rentals'

  #user controller
  devise_for :users
  get '/admin', to: 'user#admin_login', as: 'admin_login'
  get '/login', to: 'user#login', as: 'login'
  get '/logout', to: 'user#logout', as: 'logout'
  get '/profile', to: 'user#profile', as: 'profile'

  #site controller
  get '/about' => 'site#about'
  get '/contact' => 'site#contact'

  #profile controller
  resources :profiles
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'

  #bikes controller
  get '/', to: 'bike#bikes', as: 'bikes'
  get '/rent_a_bike/:bike_id', to: 'bike#rent_a_bike', as: 'rent_a_bike'
  post '/save_bike_rental', to: 'bike#save_bike_rental', as: 'save_bike_rental' 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
