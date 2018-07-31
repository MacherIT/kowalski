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

FactoryBot.define do
  factory :cuota do
    adquisicion nil
    monto "9.99"
    fecha_vencimiento "2018-07-27"
  end
end
