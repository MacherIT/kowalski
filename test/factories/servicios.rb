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

FactoryBot.define do
  factory :servicio do
    precio "9.99"
    comentarios "Un comentario acerca del servicio"
    inicio { Time.zone.today }
    fin { Time.zone.today + 1.year }
    empresa
  end
end
