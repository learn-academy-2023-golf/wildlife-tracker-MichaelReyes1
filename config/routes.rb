Rails.application.routes.draw do
  resources :animals do
  resources :sightings, only: [:create, :update, :destroy]
  end
end
