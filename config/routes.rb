Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "posts#index"
    devise_for :users
    resources :users, only: :show
    get "/posts/:context", to: "posts#index", as: :posts_index
    resources :categories, only: [:index, :show] do
      resources :topics, only: [:index, :show] do
        resource :posts, only: [:index, :show]
      end
    end
  end
end
