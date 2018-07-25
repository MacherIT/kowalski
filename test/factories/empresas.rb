# == Schema Information
#
# Table name: empresas
#
#  created_at :datetime         not null
#  cuit_0     :integer          default(0)
#  cuit_1     :bigint(8)        default(0)
#  cuit_2     :integer          default(0)
#  id         :bigint(8)        not null, primary key
#  nombre     :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_empresas_on_cuit_0  (cuit_0)
#  index_empresas_on_cuit_1  (cuit_1)
#  index_empresas_on_cuit_2  (cuit_2)
#  index_empresas_on_nombre  (nombre)
#

FactoryBot.define do
  factory :empresa do
    nombre { Faker::Ancient.hero }
    cuit_0 { [20, 27, 30].sample }
    cuit_1 { rand(10_000_000..90_000_000) }
    cuit_2 { rand(0..9) }
  end
end
