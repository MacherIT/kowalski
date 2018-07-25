# == Schema Information
#
# Table name: cuentas_proveedores
#
#  created_at :datetime         not null
#  empresa_id :bigint(8)
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cuentas_proveedores_on_empresa_id  (empresa_id)
#  index_cuentas_proveedores_on_nombre      (nombre)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#

class CuentaProveedor < ApplicationRecord
  belongs_to :empresa

  def self.options_for_select(tipo, klass=nil)
    all.map do |c|
      [
        c.nombre,
        c.id,
        class: "option_cuenta_#{tipo} #{to_s.underscore} #{klass}"
      ]
    end
  end
end
