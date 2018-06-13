# == Schema Information
#
# Table name: empleados
#
#  apellido   :string
#  created_at :datetime         not null
#  cuit       :string
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :empleado do
    nombre "Ruben"
    apellido "Berger"
    cuit "20-30256978-2"
  end
end
