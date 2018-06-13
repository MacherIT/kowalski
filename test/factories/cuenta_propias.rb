FactoryBot.define do
  factory :cuenta_propia do
    nombre { CUENTAS_PROPIAS.sample }
    dueno nil
  end
end
