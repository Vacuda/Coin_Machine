Rails.application.routes.draw do




##COINS
	
	get 'coins/'           			=> 'coins#all'
	get 'coins/show/:id' 			=> 'coins#show_one'
	post 'coins/create' 			=> 'coins#create'
	patch 'coins/update/:id' 		=> 'coins#update'
	get 'coins/destroy/:id' 		=> 'coins#destroy'

	get 'coins/total'				=> 'coins#total'


##TRANSACTIONS

	get 'transactions/'				=> 'transactions#all'
	post 'transactions/create'		=> 'transactions#create'

	get 'transactions/all_for_api'	=> 'transactions#all_for_api'


##ADMIN  --(should be plural! Oops)

	get 'admin/'					=> 'admin#all'
	post 'admin/create'				=> 'admin#create'
	patch 'admin/update/:id'		=> 'admin#update'
	get 'admin/destroy/:id'			=> 'admin#destroy'

    get 'admin/all_emails'			=> 'admin#all_emails'
    

##KEYS

    get 'keys/'					    => 'keys#all'
    get 'keys/create'				=> 'keys#create'
    get 'keys/destroy/:id'			=> 'keys#destroy'

















##CATCH ALL
	match '*path'				=> 'coins#index', via: :all









    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'

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
