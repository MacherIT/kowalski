# == Schema Information
#
# Table name: cuentas_propias
#
#  created_at :datetime         not null
#  dueno_id   :bigint(8)
#  id         :bigint(8)        not null, primary key
#  nombre     :string           not null
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
end
