# == Schema Information
#
# Table name: duenos
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  nombre     :string
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :dueno do
    nombre { DUENO.sample }
  end
end
