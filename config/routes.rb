Rails.application.routes.draw do
  resources :tasks do
    member do
      put :done
      put :undo
    end
  end

  root to: 'tasks#index'
end
