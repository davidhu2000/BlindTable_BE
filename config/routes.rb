Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:create, :show]
    resource :session, only: [:create]
<<<<<<< HEAD
    resources :availabilities, only: [:create]
=======
    resources :reservations, only: [:create, :show, :index, :update, :destroy]
    resources :reservation_joins, only: [:create, :destroy]
>>>>>>> 1faf192303306ed68602bbc256eafac4aa443665
  end
end
