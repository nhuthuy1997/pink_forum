Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    devise_for :users
    resources :users, only: :show
    get "/posts/:context", to: "static_pages#index"
    resources :categories, only: [:index, :show] do
      resources :topics, only: [:index, :show] do
        resource :posts, only: [:index, :show]
      end
    end
  end
end
