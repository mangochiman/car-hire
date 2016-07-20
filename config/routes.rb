ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  map.login  '/login',  :controller => 'users', :action => 'login'
  map.our_services  '/our_services',  :controller => 'pages', :action => 'our_services'
  map.about_us  '/about_us',  :controller => 'pages', :action => 'about_us'
  map.our_mission  '/our_mission',  :controller => 'pages', :action => 'our_mission'
  map.gallery  '/gallery',  :controller => 'pages', :action => 'gallery'
  map.contact_us  '/contact_us',  :controller => 'pages', :action => 'contact_us'
  map.admin  '/admin',  :controller => 'admin', :action => 'home'
  map.bookings '/bookings/:car_id', :controller => 'pages', :action => 'bookings'
  map.search_bookings '/search_bookings', :controller => 'pages', :action => 'search_bookings'
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "pages", :action => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
