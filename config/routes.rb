Mtb::Application.routes.draw do
  get 'kindeditor/images_list'

  post 'kindeditor/upload'

  resources :pages,:only => [:show]

  namespace :admin do
    resources :pages
  end

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
  #root :to => "login#index"
  # See how all your routes lay out with "rake routes"
  root :to => 'home#index'

  get '/help' => 'help#index'

  get '/admin' => "admin/home#index"


  get '/login' => 'login#login'
  get '/logout' => 'login#logout'
  post '/auth' => 'login#auth', :as => :auth
  get '/signup' => 'login#signup', :as => :signup
  post '/signup' => 'login#post_signup'


  get '/profile' => 'profile#index', :as => :profile

  resources :messages
  
  resources :groups
	resources :industries

  resources :activities do
		collection do 
			get :map
			get :act_add
		end
  end
  
  

  scope "api" do
    get 'cities' => 'api#cities'
    get 'categories' => 'api#categories'
    get '/search' => 'api#search'
    get '/activities/:id' => 'api#activity'
    post 'login' => 'api#login'
    get '(/:city)' => 'api#activities'
  end

  get '/:city/map' => 'activities#map', :as => :map
  get '/:city/(:category)' => 'activities#city_home', :as => :city_home

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'


end
