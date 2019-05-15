Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients
      resources :cocktails
      resources :proportions
    end
  end
end
