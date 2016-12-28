Rails.application.routes.draw do
  
  root :to => 'public#index'
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  resources :admin_users, :except => [:show]  do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  # 'simple route' or 'match route'
  # get 'demo/index'

  # default routes
  # listed last so it matches if nothing else does
   match ':controller(/:action(/:id))', :via => :get


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
