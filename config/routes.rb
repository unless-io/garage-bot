Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  mount Facebook::Messenger::Server, at: 'bot'

  root to: 'pages#home'
  get '/dashboard', to: 'dashboards#index'

  namespace :dashboard do
    resources :ongoing, controller: "ongoings", only: [:index]
    resources :templates, controller: "questionaires" do
      resources :questions, only: [:create, :destroy]
    end
    resources :users, except: [:new, :create] do
      resources :treatments, controller: "treatment_processes", except: [:new]
      resources :evaluations, only: [:index, :show]
    end

  end
  get '/facebook_account_link', to: 'synchronisations#facebook_account_link'
  get '/facebook_account_confirmation', to: 'synchronisations#facebook_account_confirmation'
end
