Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    member do
      put :done
      put :undo
    end
  end

  root to: 'tasks#index'
end
