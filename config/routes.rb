Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'main#feed'
   post 'enter' => 'application#enter'
   get 'login/:token' => 'application#login_by_email'
   get 'exit' => 'application#exit'
   get 'feedusers' => 'main#feedusers'
   get 'allusers' => 'main#allusers'
   get 'all' => 'main#all'
   get 'email' => 'main#email'
   get 'about' => 'main#about'
   
   post '/test' => 'application#test'
   
   get 'settings' => 'main#settings'
   post 'settings' => 'main#updatesettings'

post '/all' => 'main#all_add'
post 'allusers' => 'main#allusers_add'
post 'feedusers' => 'main#feedusers_add'

get '/:id' => 'main#user'
post '/:id' => 'main#user_add'
post '/' => 'main#feed_add'



   post ':controller/:action/(:id)/'
   
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
