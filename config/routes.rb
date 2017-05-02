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
    resources :treatments, controller: "treatment_processes"
    resources :evaluations, only: [:index, :show]
    resources :users, only: [:show, :index]
  end
  get '/facebook_account_link', to: 'synchronisations#facebook_account_link'
  get '/facebook_account_confirmation', to: 'synchronisations#facebook_account_confirmation'
end
