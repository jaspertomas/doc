Doc::Application.routes.draw do
  
  match "/categories/get_states/:id" => "categories#get_states", :as => "get_category_states", :via => [:get]

  resources :states

  match "/posts/convert_to_topic" => "posts#convert_to_topic", :as => "convert_post_to_topic", :via => [:post]
  resources :comments
    
  match "/posts/add_new_comment" => "posts#add_new_comment", :as => "add_new_comment_to_posts", :via => [:post]
  match "/topics/add_new_comment" => "topics#add_new_comment", :as => "add_new_comment_to_topics", :via => [:post]  
    
  resources :topics
  post "topics/move"


  resources :posts
  post "posts/move"

   root :to => 'static_pages#index'
  get "static_pages/index"

  get "static_pages/help"

  get "static_pages/admin"

  get "static_pages/error"

  get "static_pages/initdb"

  resources :categories


  resources :articles


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
