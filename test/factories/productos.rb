# == Schema Information
#
# Table name: productos
#
#  created_at        :datetime         not null
#  id                :bigint(8)        not null, primary key
#  nombre            :string           default(""), not null
#  precio_default    :decimal(, )
#  tipo_pago_default :integer          default(0), not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_productos_on_nombre  (nombre)
#

FactoryBot.define do
  factory :producto do
    nombre "MyString"
    precio_default "9.99"
    tipo_pago_default 1
  end
end
