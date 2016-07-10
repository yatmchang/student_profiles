Rails.application.routes.draw do

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  get 'password_resets/new'

  root "home#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "/contact/:user_id" => "profiles#new_contact"
  post "/contact/:user_id" => "profiles#contact", as: :contact

  resources :users, only: [:new, :create, :edit, :update, :show, :index] do
    resources :profiles, only: [:edit, :update], as: :profile  do
      resources :links, only: [:create, :update, :destroy]
      resources :educations, only: [:create, :update, :destroy]
      resources :skills, only: [:create, :update, :destroy]
      resources :experiences, only: [:create, :edit, :update, :destroy]
      resources :projects, only: [:create, :update, :destroy, :show, :edit]
    end
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :password_resets
end
