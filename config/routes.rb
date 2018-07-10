Rails.application.routes.draw do
  resources :cuentas_gastos
  resources :conceptos_gastos
  resources :cuentas_sueldos
  resources :empleados
  resources :cuentas_propias
  resources :duenos
  devise_for :users

  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end
  resources :movimientos, concerns: :paginatable

  mount Sidekiq::Web => "/sidekiq" # monitoring console
  root "movimientos#index"
  match "*unmatched", to: "errors#route_not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
