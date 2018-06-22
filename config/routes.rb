Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  post '/', to: 'welcome#search'
  get 'view_list', to: 'welcome#view_list'

  resources :pack do 
    member do
      post :own_all
      post :proxy_all
      post :disown_all
      post :unproxy_all
    end
  end
  resources :box do 
    member do
      post :own_all
      post :proxy_all
      post :disown_all
      post :unproxy_all
    end
  end
  resources :cycle

  resources :card do
    collection do
      post :own_all
      post :proxy_all
      post :disown_all
      post :unproxy_all
    end
    member do
      post :proxy
      post :own
      post :disown
      post :unproxy
    end
  end
end
