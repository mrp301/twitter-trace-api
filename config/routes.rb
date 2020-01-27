Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
      resources :users do
        member do
          get :timeline
          get :my_tweets
        end
      end
      resources :tweets
      resources :follows
    end
  end
end