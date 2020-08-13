Rails.application.routes.draw do
  resources :cocktails, only: [:create, :index, :new, :show] do 
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:new, :create, :destroy]
end
