Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  resources :profiles, only: :show
end
