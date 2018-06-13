# == Schema Information
#
# Table name: conceptos_gastos
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :concepto_gasto do
    nombre { CONCEPTOS_GASTOS.sample }
  end
end
