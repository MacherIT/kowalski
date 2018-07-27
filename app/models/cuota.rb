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
  default_scope { order(fecha_vencimiento: :desc) }
end
