Rails.application.routes.draw do
  resources :categories

  resources :users do
    resources :posts, only: [:edit, :update, :destory]  do
      resources :images,only: [:edit, :update, :show, :destory]
    end
  end

  # add a collection search - Q
  resources :posts, except: [:destory] do
    collection do
      post 'search'
    end
  end

  resources :images, except: [:edit, :update, :show, :destory]

  resources :cities do
    resources :districts, only: [:edit, :update, :show, :destory] do
      resources :wards, only: [:edit, :update, :show, :destory] do
        resources :streets, only: [:edit, :update, :show, :destory]
      end
    end
  end
  resources :districts, except: [:edit, :update, :show, :destory]
  resources :wards, except: [:edit, :update, :show, :destory]
  resources :streets, except: [:edit, :update, :show, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
