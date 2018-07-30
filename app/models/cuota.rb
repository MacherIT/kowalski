# == Schema Information
#
# Table name: cuotas
#
#  adquisicion_id    :bigint(8)
#  concepto          :string           default("Cuota unica"), not null
#  created_at        :datetime         not null
#  fecha_vencimiento :date
#  id                :bigint(8)        not null, primary key
#  monto             :decimal(, )      default(0.0), not null
#  pagada            :boolean          default(FALSE)
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cuotas_on_adquisicion_id  (adquisicion_id)
#
# Foreign Keys
#
#  fk_rails_...  (adquisicion_id => adquisiciones.id)
#

class Cuota < ApplicationRecord
  belongs_to :adquisicion, inverse_of: :cuotas
  has_one :empresa, through: :adquisicion
  has_many :movimientos, dependent: :nullify
  default_scope { order(fecha_vencimiento: :asc) }

  # Devuelve el total abonado
  def total_abonado
    movimientos.sum(:monto)
  end

  def recalcular_pagos
    return unless total_abonado >= monto
    self.pagada = true
    save
  end
end
