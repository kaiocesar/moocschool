Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
  get 'home/index'
  root 'home#index'

  namespace :api, defaults: { format: :json } do 
    namespace :v1 do
      resources :dashboard, only: :index
      resources :courses, only: [:index, :create, :update]
    end
  end
end
