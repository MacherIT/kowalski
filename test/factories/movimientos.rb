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
#  fecha_efectiva      :date
#  fecha_supuesta      :date
#  hecha               :boolean
#  id                  :bigint(8)        not null, primary key
#  monto               :decimal(, )      default(0.0), not null
#  updated_at          :datetime         not null
#
# Indexes
#
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
