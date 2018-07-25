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

class CuentaCliente < ApplicationRecord
  belongs_to :empresa

  has_many :debitos, class_name: "Movimiento",
                     foreign_key: "cuenta_debito_id",
                     dependent: :nullify,
                     inverse_of: :cuenta_debito

  has_many :creditos, class_name: "Movimiento",
                      foreign_key: "cuenta_credito_id",
                      dependent: :nullify,
                      inverse_of: :cuenta_credito

  def self.options_for_select(tipo, klass=nil)
    all.map do |c|
      [
        c.nombre,
        c.id,
        class: "option_cuenta_#{tipo} #{to_s.underscore}  #{klass}"
      ]
    end
  end
end
