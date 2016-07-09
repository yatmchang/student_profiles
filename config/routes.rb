Rails.application.routes.draw do





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users, only: [:new, :create, :edit, :update, :show, :index] do
    resources :profiles, only: [:edit, :update] do
      resources :links, only: [:create, :update, :destroy]
      resources :educations, only: [:create, :update, :destroy]
      resources :skills, only: [:create, :update, :destroy]
    end
  end
  root "users#new"
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :experiences
end
