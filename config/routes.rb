Rails.application.routes.draw do
  resources :votes, except: :create
  resources :comments, except: :create do
    resources :comments, module: 'comments', except: [:show, :update]
    resources :votes, module: 'comments', except: [:show, :update]
  end
  resources :posts do
    resources :comments, module: 'posts', except: [:show, :update]
    resources :votes, module: 'posts', except: [:show, :update]
  end
  resources :users, except: [:destroy,:create]

  mount_devise_token_auth_for 'User', at: 'auth'
  get 'signed_url', to: 'signing#index'
end
