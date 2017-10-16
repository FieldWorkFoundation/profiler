Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  resources :profiles, only: :show do
    resources :assessments, only: [] do
      resources :ratings, except: :destroy
    end
  end
end
