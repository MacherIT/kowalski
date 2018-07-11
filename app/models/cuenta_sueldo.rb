# == Schema Information
#
# Table name: cuentas_sueldos
#
#  created_at  :datetime         not null
#  empleado_id :bigint(8)
#  id          :bigint(8)        not null, primary key
#  nombre      :string           not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_cuentas_sueldos_on_empleado_id  (empleado_id)
#
# Foreign Keys
#
#  fk_rails_...  (empleado_id => empleados.id)
#

class CuentaSueldo < ApplicationRecord
  belongs_to :empleado
  has_many :debitos, class_name: "Movimiento",
                     foreign_key: "cuenta_debito_id",
                     dependent: :nullify,
                     inverse_of: :cuenta_debito

  has_many :creditos, class_name: "Movimiento",
                      foreign_key: "cuenta_credito_id",
                      dependent: :nullify,
                      inverse_of: :cuenta_credito

  def self.options_for_select(tipo)
    all.map do |c|
      [c.nombre, c.id, class: "option_cuenta_#{tipo} #{to_s.underscore}"]
    end
  end
end
