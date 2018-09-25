Rails.application.routes.draw do
  # Paginacion
  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  # Usuarios
  devise_for :users

  # Solo para usuarios autenticados (todo el sitio)
  authenticated :user do
    resources :empresas do
      resources :adquisiciones
      resources :servicios
    end
    resources :movimientos
    resources :servicios
    resources :cuotas, concerns: :paginatable do
      resources :movimientos, controller: "cuota_movimientos", concerns: :paginatable
    end
    resources :adquisiciones
    resources :cuentas_gastos
    resources :conceptos_gastos
    resources :cuentas_sueldos
    resources :empleados
    resources :cuentas_propias
    resources :duenos
    mount Sidekiq::Web => "/sidekiq" # monitoring console
    root to: "movimientos#index" # , as: :authenticated_root
  end

  # Si no esta autenicado
  root to: redirect("/users/sign_in")

  # Errores de ruteo
  match "*unmatched", to: "errors#route_not_found", via: :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
