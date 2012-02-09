Dweeb::Application.routes.draw do
root :to => 'users#homepage'
match 'homepage' =>'users#homepage',:as=> :homepage
match 'profiles/show/:id'=>'profiles#show',:id=>:id ,:as=> :show_profile
match 'profiles/edit/:id'=>'profiles#edit',:id=>:id ,:as=> :edit_profile
match 'profiles/update/:id' =>'profiles#update',:as=> :edit_update 
match 'profiles/upload/:id' =>'profiles#upload',:as=> :upload_profilepicture
match 'profiles/image_writer/:id' =>'profiles#image_writer',:as=> :picture_save 
match 'login' =>'tempstores#new',:as=> :login
match 'tempstores/login' =>'tempstores#login'
match 'users/verify/:id'=>'users#verify',:id=>:id ,:as=> :verify_user
match 'tempstores/logout' =>'tempstores#logout'
match 'messages/create/:id'=>'messages#create'
match 'posts/show/:id'=>'posts#show'
match 'posts/selfshow/:id'=>'posts#selfshow'
match 'posts/createpost/:id'=>'posts#createpost'
match 'bookmarks/show/:id'=>'bookmarks#show',:as=> :show_profile
match 'bookmarks/delete/:id'=>'bookmarks#delete'
match 'interests/show/:id'=>'interests#show'
match 'interests/delete/:id'=>'interests#delete'
match 'messages/show/:id'=>'messages#show'
match 'messages/connect/:id'=>'messages#connect'
match 'skills/show/:id'=>'skills#show'
match 'skills/delete/:id'=>'skills#delete'
  # The priority is based upon order of creation:
  # first created -> highest priority.
#match 'login'=>'users#login', :as=> :login
#match 'logout'=>'users#logout', :as=> :logout
#match 'verify'=>'users#verify', :as=> :verify
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
match ':controller(/:action(/:id(.:format)))'
end
