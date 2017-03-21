Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :dashboard do
    resources :ongoing, controller: "ongoings", only: [:index]
    resources :templates, controller: "questionaires"
    resources :users, except: [:new, :create] do
      resources :treatments, controller: "treatment_processes", except: [:new]
      resources :evaluations, only: [:index, :show]
    end
  end
end
