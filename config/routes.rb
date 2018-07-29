Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/csrf-token', to: 'home#csrf_token'

  scope path: '/api' do
    scope path: '/v1' do
      resources :rooms
      resources :videos
      resources :search, only: :index
    end
  end
end
