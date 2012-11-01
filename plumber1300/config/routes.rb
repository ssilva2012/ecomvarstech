Plumber1300::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :feedback_shorts

  resources :carts

  get "postcode_cart/index"

  resources :postcode_suburbs

  resources :feedbacks

  get "static_pages/home"
  get "static_pages/aboutus"
  get "static_pages/contactus"
  get "static_pages/diytutorials"
  get "static_pages/faq"
  get "static_pages/plumbersection"
  get "static_pages/faqplumber"
  get "static_pages/advertising"
  get "static_pages/howitworks"
  get "static_pages/callrates"
  get "static_pages/fineprint" 
  

  resources :suppliers

  resources :products

  resources :users

  resources :postcodes

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
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
  root :to => 'static_pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  # admin mapping
  get 'admin/postcode' => 'postcodes#index'
  get 'admin/postcode/new' => 'postcodes#new'
  get 'admin/postcode/:id/edit/' => 'postcodes#edit'
  get 'admin/postcodesuburbs' => 'postcode_suburbs#index'
  get 'admin/postcodesuburbs/new' => 'postcode_suburbs#new'
  get 'admin/postcodesuburbs/:id/edit/' => 'postcode_suburbs#edit'
  
  get 'admin/user' => 'users#index'
  get 'admin/user/new' => 'users#new'
  get 'admin/user/:id/edit/' => 'users#edit'
  get 'admin/product' => 'products#index'
  get 'admin/product/new' => 'products#new'
  get 'admin/suppliers' => 'suppliers#index'
  get 'admin/suppliers/new' => 'suppliers#new'
  get 'admin/feedback' => 'feedback_shorts#index'
  
  #static pages mapping
  get 'home' => 'static_pages#home'
  get 'privacy' => 'static_pages#privacy'
  get 'serviceterms' => 'static_pages#serviceterms'
  get 'advertisehere' => 'static_pages#advertisehere'
  get 'refund' => 'static_pages#refund'
  get 'aboutus' => 'static_pages#aboutus'
  get 'contactus' => 'static_pages#contactus'
  get 'diytutorials' => 'static_pages#diytutorials'
  get 'faq' => 'static_pages#faq'
  get '/findPostcode' => 'postcodes#findpostcode'
  post '/addCartItem' => 'carts#addCartItem'

  #plumber pages mapping
  get '/plumber/faq' => 'static_pages#faqplumber'
  get '/plumber/home' => 'static_pages#plumbersection'
  get '/plumber/advertising' => 'static_pages#advertising'
  get '/plumber/howitworks' => 'static_pages#howitworks'
  get '/plumber/callrates' => 'static_pages#callrates'
  get '/plumber/fineprint' => 'static_pages#fineprint'

  get 'newuser' => 'users#newUser'
  post 'signup' => 'users#signUp'
  get 'feedback' => 'feedback_shorts#new'
  
  


end
