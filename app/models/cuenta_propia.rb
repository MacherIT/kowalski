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

class CuentaPropia < ApplicationRecord
  belongs_to :dueno
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
