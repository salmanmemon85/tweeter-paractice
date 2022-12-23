require 'sidekiq/web'

Rails.application.routes.draw do
  resources :profiles
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

resources :tweets, except: [:edit, :update] do
  resources :comments, except: [:create, :destroy]
  member do
    post :retweet
  end
end
  devise_for :users
  root to: 'tweets#index'

end
