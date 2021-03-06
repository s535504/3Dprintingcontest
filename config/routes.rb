Rails.application.routes.draw do


  post 'contactus' => 'static_pages#contactus'

  post  'language' => 'sessions#create'

  devise_for :users
  get 'registermanagement' => 'admins#registermanagement'
  get 'filemanagement' => 'admins#filemanagement'

  root 'static_pages#home'

  get  'info'      => 'static_pages#info'
  get  'declare'   => 'static_pages#declare'
  get  'search'    => 'static_pages#search'
  get  'form'      => 'static_pages#form'

  get 'prohibit' => 'registers#prohibit'

  get 'allpayform' => 'static_pages#allpayform'

  post 'notify', to: 'static_pages#notify', as: 'notify'

  get "static_pages/check_email", :controller => "static_pages", :action => "check_email"
  # get  'search'    => 'registers#search'
  # post 'search'    => 'registers#searched'
  # get  'show'      => 'registers#show'
  # get  'registers' => 'registers#new'
  # post 'registers' => 'registers#create'
  # get  'confirm'   => 'registers#confirm'
  resources :transactions, only: :index
  resources :registers
  resources :tdmfiles,     only: [:create,:destroy]
  resources :works,        only: [:index,:show,:create,:destroy]
  resources :displayingwork, only: :update
  resources :banners, only: [:index,:update]


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
