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
end
