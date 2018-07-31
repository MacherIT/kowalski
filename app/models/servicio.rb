# == Schema Information
#
# Table name: servicios
#
#  comentarios :string
#  created_at  :datetime         not null
#  empresa_id  :bigint(8)        not null
#  fin         :date
#  id          :bigint(8)        not null, primary key
#  inicio      :date
#  precio      :decimal(, )      default(0.0), not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_servicios_on_empresa_id  (empresa_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#

# Los servicios son aquellas prestaciones de proveedores a Macher que
# generan un costo mensual. Por ej: internet, contadores, telefono, etc.

class Servicio < ApplicationRecord
  belongs_to :empresa
  has_many :cuotas, dependent: :nullify
  before_destroy :check_cuotas

  private

  # No se podra detruir si tiene cuotas asociadas
  def check_cuotas
    throw :abort unless cuotas.none?
  end
end
