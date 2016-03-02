Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'main#feed'
   #root 'wishes#index'
   root 'request#index'
   get 'req' => 'request#req'
   get 'test' => 'request#test'
   post 'new_req' => 'request#create'
   #get 'sochi' => 'sochi#index'
   get 'a' => 'main#all'
   post 'enter' => 'application#enter'
   post 'new_inst' => 'inst#create'
   post 'new_wish' => 'wishes#create'
   
   get 'login/:token' => 'application#login_by_email'
   get 'exit' => 'application#exit'
   get 'feedusers' => 'main#feedusers'
   get 'allusers' => 'main#allusers'
   get 'myfollowers' => 'main#my_followers'
   
   get 'askfeed' => 'ask#ask_feed'
   get 'askfeedusers' => 'ask#ask_feed_users'
   get 'new_ask/:id' => 'ask#new_ask_form'
   post 'new_ask/:id' => 'ask#new_ask'
   get 'mynewask' => 'ask#my_new_ask'
   post 'mynewask/:id' => 'ask#my_new_answer'
   get 'allask' => 'ask#all_ask'
   get 'askallusers' => 'ask#ask_all_users'
   get 'myquestions' => 'ask#my_questions'
   get 'answer/:id' => 'ask#answer'
   get 'askfollowers' => 'ask#askfollowers'
   
   
   get 'inst' => 'inst#index', as: :inst_index
   get 'allusersinst' => 'inst#allusersinst'
   get 'feedusersinst' => 'inst#feedusersinst'
   get 'feedinst' => 'inst#feedinst'
   get 'instuser/:id' => 'inst#instuser'
   get 'instfollowers'=> 'inst#instfollowers'
   
   get 'all' => 'main#all'
   get 'email' => 'main#email'
   get 'about' => 'main#about'
   get 'error' => 'application#error'
   get 'tusa' => 'main#tusa'
   get 'ads' => 'main#ads'
   get 'myads' => 'main#myads'
   
   post '/test' => 'application#test'
   
   get 'settings' => 'main#settings'
   post 'settings' => 'main#updatesettings'

post '/all' => 'main#all_add'
post 'allusers' => 'main#allusers_add'
post 'feedusers' => 'main#feedusers_add'


get 'wish' => 'wishes#index'
post 'wish' => 'wishes#add'

get '/auth/:provider/callback', to: 'application#provider'

get '/:id' => 'main#user'
post '/:id' => 'main#user_add'
#post '/' => 'main#feed_add'
post '/' => 'request#add'



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
