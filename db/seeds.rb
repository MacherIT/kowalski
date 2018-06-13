# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rails.logger = Logger.new(STDOUT)

Rails.logger.info "Creando dueños"
DUENOS.each do |dueno|
  FactoryBot.create(:dueno, nombre: dueno)
end

Rails.logger.info "Creando cuentas propias"
CUENTAS_PROPIAS.each do |cuenta|
  FactoryBot.create(:cuenta_propia, nombre: cuenta[:nombre], dueno: Dueno.where(nombre: cuenta[:dueno]).first)
end
