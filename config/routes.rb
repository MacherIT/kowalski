Rails.application.routes.draw do
  resources :cuentas_sueldos
  resources :empleados
  resources :cuentas_propias
  resources :duenos
  devise_for :users
  mount Sidekiq::Web => "/sidekiq" # monitoring console
  root "home#index"
  match "*unmatched", to: "errors#route_not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
