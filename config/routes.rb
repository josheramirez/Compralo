Rails.application.routes.draw do


  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

#para llamara esta pagina debo crear metodo algo em controlador y una vista con el mismo nonmbre
# en cambio para el show q le paso parametros /id tiene q crearse con resource
get 'microposts/algo'



root            		 'static_pages#home'

  get     'proveedores'        => 'users#proveedores'
  get     'bodega'        => 'microposts#bodega'
  get     'publicaciones' => 'microposts#ventas_publicadas'
  get     'ventas' => 'compras#index'
  get 		'help'    => 'static_pages#help'
  get 		'about'   => 'static_pages#about'
  get 		'contact' => 'static_pages#contact'
  get 		'singup'  => 'users#new'
  get		  'login'	  => 'sessions#new'
  post		'login'	  => 'sessions#create'
  delete 	'logout'  => 'sessions#destroy'


#get 'comprar' => ''


# obtengpo el crud de usuarios
#resources :users

resources :users do
member do
get :following, :followers
end
end

# ruta de metodo edit

resources :compras

resources :account_activations, only: [:edit]
resources :password_resets,only: [:new, :create, :edit, :update]
resources :microposts,only: [:create, :destroy, :show, :update]
resources :relationships,only: [:create, :destroy]
end
