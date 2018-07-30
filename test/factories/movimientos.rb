# == Schema Information
#
# Table name: movimientos
#
#  concepto            :string
#  created_at          :datetime         not null
#  cuenta_credito_id   :bigint(8)
#  cuenta_credito_type :string
#  cuenta_debito_id    :bigint(8)
#  cuenta_debito_type  :string
#  cuota_id            :bigint(8)
#  fecha_efectiva      :date
#  fecha_supuesta      :date
#  hecha               :boolean
#  id                  :bigint(8)        not null, primary key
#  monto               :decimal(, )      default(0.0), not null
#  updated_at          :datetime         not null
#
# Indexes
#
# rubocop:disable LineLength
#  index_movimientos_on_cuenta_credito_type_and_cuenta_credito_id  (cuenta_credito_type,cuenta_credito_id)
#  index_movimientos_on_cuenta_debito_type_and_cuenta_debito_id    (cuenta_debito_type,cuenta_debito_id)
#  index_movimientos_on_cuota_id                                   (cuota_id)
# rubocop:enable LineLength
#
# Foreign Keys
#
#  fk_rails_...  (cuota_id => cuotas.id)
#

FactoryBot.define do
  factory :movimiento do
    concepto { Faker::DumbAndDumber.quote }
    fecha_supuesta { Time.zone.today + rand(-15..15).days }
    fecha_efectiva { fecha_supuesta + rand(30).days }
    hecha true
    cuenta_debito nil
    cuenta_credito nil
    monto { rand(1000) }

    factory :mov_gasto do
      cuenta_debito { CuentaPropia.all.sample }
      cuenta_credito { CuentaGasto.all.sample }
    end
  end
end
