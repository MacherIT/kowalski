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

class CuentaGasto < ApplicationRecord
  belongs_to :concepto_gasto
  has_many :debitos, class_name: "Movimiento", foreign_key: "cuenta_debito_id",
                     inverse_of: :cuenta_debito, dependent: :nullify
  has_many :creditos, class_name: "Movimiento",
                      foreign_key: "cuenta_credito_id",
                      inverse_of: :cuenta_credito, dependent: :nullify
end
