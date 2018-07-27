Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    resources :empresas do
      resources :adquisiciones
    end
    resources :adquisiciones
    resources :cuentas_gastos
    resources :conceptos_gastos
    resources :cuentas_sueldos
    resources :empleados
    resources :cuentas_propias
    resources :duenos

    concern :paginatable do
      get "(page/:page)", action: :index, on: :collection, as: ""
    end
    resources :movimientos, concerns: :paginatable

    mount Sidekiq::Web => "/sidekiq" # monitoring console

    root to: "movimientos#index" # , as: :authenticated_root
  end

  # root to: "movimientos#index"
  root to: redirect("/users/sign_in")

  # root "movimientos#index"
  match "*unmatched", to: "errors#route_not_found", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
