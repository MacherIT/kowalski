# == Schema Information
#
# Table name: cuentas_propias
#
#  created_at :datetime         not null
#  dueno_id   :bigint(8)
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cuentas_propias_on_dueno_id  (dueno_id)
#
# Foreign Keys
#
#  fk_rails_...  (dueno_id => duenos.id)
#

FactoryBot.define do
  factory :cuenta_propia do
    nombre { CUENTAS_PROPIAS.sample[:nombre] }
    dueno
  end
end
