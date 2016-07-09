Rails.application.routes.draw do


  resources :educations
  resources :skills


  root "educations#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
