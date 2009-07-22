ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  
  # Include some very specific 301 Redirects for top content and people following old links and Search Engines.
  # index.php links were from the wiki; .html links were from the original Dreamweaver site.
  map.connect '/scj.htm', :controller => 'redirect', :url => '/people/15'
  map.connect '/index.php/Principal_Investigator', :controller => 'redirect', :url => '/people/15'
  map.connect '/index.php/People', :controller => 'redirect', :url => '/people'
  map.connect '/index.php/Rhesus_Brain_Atlas', :controller => 'redirect', :url => '/pages/2'
  map.connect '/index.php/Research', :controller => 'redirect', :url => '/about/research_objectives'
  map.connect '/index.php/Employment', :controller => 'redirect', :url => '/opportunites/researchers'
  map.connect '/opportunities/employment.html', :controller => 'redirect', :url => '/opportunites/researchers'
  map.connect '/index.php/Publications', :controller => 'redirect', :url => '/publications'
  map.connect '/publications.html', :controller => 'redirect', :url => '/publications'
  map.connect '/index.php/Neuropsychology_Neuroimaging_Lab', :controller => 'redirect'

  
  # map.register '/register', :controller => 'users', :action => 'create'
  # map.signup '/signup', :controller => 'users', :action => 'new'
  # map.resources :users

  map.resource :session

  map.resources :pages
  
  
  map.current_studies 'about/current_studies', :controller => 'application', :action => 'current_studies'
  map.research_objectives 'about/research_objectives', :controller => 'application', :action => 'research_objectives'
  map.opportunities 'opportunites/:opportunity_type', :controller => 'job_advertisements', :action => 'index'
  
  map.resources :authorships
 
  map.resources :study_descriptions
  
  map.resources :events

  map.resources :job_advertisements

  map.resources :publications

  map.resources :personnel_groups

  map.resources :addresses

  map.resources :people
  
  map.root :controller => 'application', :action => 'index'

  # The priority is based upon order of creation: first created -> highest priority.

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
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  map.permalinked_pages '/:permalink.:format', :controller => 'pages', :action => 'show'
end
