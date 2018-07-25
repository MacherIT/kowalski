# == Schema Information
#
# Table name: cuentas_clientes
#
#  created_at :datetime         not null
#  empresa_id :bigint(8)
#  id         :bigint(8)        not null, primary key
#  nombre     :string           default("f")
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cuentas_clientes_on_empresa_id  (empresa_id)
#  index_cuentas_clientes_on_nombre      (nombre)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#

FactoryBot.define do
  factory :cuenta_cliente do
    nombre "Cuenta corriente"
    empresa
  end
end
