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
#  servicio_id       :bigint(8)
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cuotas_on_adquisicion_id  (adquisicion_id)
#  index_cuotas_on_servicio_id     (servicio_id)
#
# Foreign Keys
#
#  fk_rails_...  (adquisicion_id => adquisiciones.id)
#  fk_rails_...  (servicio_id => servicios.id)
#

class Cuota < ApplicationRecord
  belongs_to :adquisicion, inverse_of: :cuotas, optional: true
  belongs_to :servicio, inverse_of: :cuotas, optional: true
  has_one :empresa, through: :adquisicion
  has_many :movimientos, dependent: :nullify
  default_scope { order(fecha_vencimiento: :asc) }
  scope :with_fecha_comienzo, lambda { |fecha_ini|
    where("fecha_vencimiento >= ?", fecha_ini)
  }
  # scope :with_fecha_fin, -> (fecha_fin) {
  #   where("fecha_vencimiento <= ?", fecha_fin)
  # }

  filterrific(
    default_filter_params: { with_fecha_comienzo: Time.zone.today - 7.days },
    available_filters: [
      :with_fecha_comienzo
      # :sorted_by,
      # :search_query,
      # :with_country_id,
      # :with_created_at_gte
    ]
  )

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
