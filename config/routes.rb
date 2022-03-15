Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :devices
      resources :brands
      resources :types
      resources :ratings
      resources :baskets
      resources :basket_devices
      resources :device_infos
    end
  end






end
