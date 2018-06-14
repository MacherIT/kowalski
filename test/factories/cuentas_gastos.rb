# == Schema Information
#
# Table name: cuentas_gastos
#
#  concepto_gasto_id :bigint(8)
#  created_at        :datetime         not null
#  id                :bigint(8)        not null, primary key
#  nombre            :string
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cuentas_gastos_on_concepto_gasto_id  (concepto_gasto_id)
#
# Foreign Keys
#
#  fk_rails_...  (concepto_gasto_id => conceptos_gastos.id)
#

FactoryBot.define do
  factory :cuenta_gasto do
    concepto_gasto
    nombre { "Cuenta #{concepto_gasto.nombre}" }
  end
end
