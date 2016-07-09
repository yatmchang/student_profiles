Rails.application.routes.draw do

  resources :links
  resources :users, only: [:new, :create, :edit, :update, :show, :index] do
    resources :profiles, only: [:edit, :update] do
      resources :links, only: [:create, :update, :destroy]
    end
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root "users#new"


end
