Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :admins, only: [:index, :show, :create, :update, :destroy]
      resources :positions, only: [:index, :show, :create, :update, :destroy]
      resources :qualifications, only: [:index, :show, :create, :update, :destroy]
      resources :school_classes, only: [:index, :show, :create, :update, :destroy]
      resources :schools, only: [:index, :show, :create, :update, :destroy]
      resources :sessions, only: [:create]
      resources :students, only: [:index, :show, :create, :update, :destroy]
      resources :teachers, only: [:index, :show, :create, :update, :destroy]
      post 'schools/register', to: 'schools#register'
      post 'schools/login', to: 'schools#login'
      resources :users, only: [:index, :create, :update, :destroy]
      post 'users/login', to: 'users#login'

      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        passwords: 'api/v1/users/passwords',
        registrations: 'api/v1/users/registrations',
        confirmations: 'api/v1/users/confirmations'
      }
    end
  end
end
