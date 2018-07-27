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

class Empresa < ApplicationRecord
  has_many :adquisiciones, dependent: :destroy

  validate :cuit_valido_0
  validate :cuit_valido_1
  validate :cuit_valido_2

  def cuit
    cuit_0.to_s + "-" + cuit_1.to_s + "-" + cuit_2.to_s
  end

  protected

  # Chequea la validez de los 3 campos del CUIT
  def cuit_valido_0
    # rubocop:disable LineLength
    errors.add(:cuit, "La primera parte debe estar entre 0 y 100") unless cuit_0.blank? || cuit_0 > 1 && cuit_0 < 100
  end

  def cuit_valido_1
    errors.add(:cuit, "la segunda parte debe estar entre 1000000 y 100000000") unless cuit_1.blank? || cuit_1 > 1_000_000 && cuit_1 < 100_000_000
  end

  def cuit_valido_2
    errors.add(:cuit, "La tercera parte debe estar entre 0 y 9.") unless cuit_2.blank? || cuit_2 >= 0 && cuit_2 < 10
  end
  # rubocop:enable LineLength
end
