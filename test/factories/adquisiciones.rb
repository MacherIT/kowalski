# == Schema Information
#
# Table name: adquisiciones
#
#  comentarios :string
#  created_at  :datetime         not null
#  empresa_id  :bigint(8)        not null
#  fin         :date
#  id          :bigint(8)        not null, primary key
#  inicio      :date
#  precio      :decimal(, )      default(0.0), not null
#  producto_id :bigint(8)        not null
#  tipo_pago   :integer          default(0), not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_adquisiciones_on_empresa_id   (empresa_id)
#  index_adquisiciones_on_producto_id  (producto_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#  fk_rails_...  (producto_id => productos.id)
#

FactoryBot.define do
  factory :adquisicion do
    precio "9.99"
    comentarios "MyString"
    tipo_pago 1
    inicio "2018-07-27"
    fin "2018-07-27"
    empresa nil
    producto nil
  end
end
