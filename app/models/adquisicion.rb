# == Schema Information
#
# Table name: adquisiciones
#
#  comentarios :string
#  created_at  :datetime         not null
#  empresa_id  :bigint(8)        not null
#  fin         :date
#  id          :bigint(8)        not null, primary key
#  inicio      :date
#  precio      :decimal(, )      default(0.0), not null
#  producto_id :bigint(8)        not null
#  tipo_pago   :integer          default(0), not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_adquisiciones_on_empresa_id   (empresa_id)
#  index_adquisiciones_on_producto_id  (producto_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#  fk_rails_...  (producto_id => productos.id)
#

class Adquisicion < ApplicationRecord
  belongs_to :empresa
  belongs_to :producto
  has_many :cuotas, dependent: :nullify
  # accepts_nested_attributes_for(
  #   :cuotas,
  #   reject_if: proc { |attributes| attributes[:monto].blank? },
  #   allow_destroy: true
  # )
  before_destroy :check_cuotas

  def tipo_pago_cast
    TIPOS_PAGO.select { |_k, v| v == tipo_pago }.keys.first.to_s.capitalize
  end

  private

  # No se podra detruir si tiene cuotas asociadas
  def check_cuotas
    throw :abort unless cuotas.none?
  end
end
