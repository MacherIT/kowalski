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
    cuenta_debito nil
    cuenta_credito nil
    concepto "Gastos random"
    fecha_supuesta "2018-06-13"
    fecha_efectiva "2018-06-13"
    hecha false
  end
end
