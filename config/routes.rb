Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
      resources :users
      resources :tweets
      resources :follows
    end
  end
end