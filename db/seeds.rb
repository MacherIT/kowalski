# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

logger = Logger.new(STDOUT)

logger.info "Creando usuarios"
FactoryBot.create(:user, email: "bruno.calmels@macherit.com", password: "macherito")

logger.info "Creando dueños"
DUENOS.each do |dueno|
  FactoryBot.create(:dueno, nombre: dueno)
end

logger.info "Creando cuentas propias"
CUENTAS_PROPIAS.each do |cuenta|
  FactoryBot.create(:cuenta_propia, nombre: cuenta[:nombre], dueno: Dueno.where(nombre: cuenta[:dueno]).first)
end

logger.info "Creando empleados"
EMPLEADOS.each do |empleado|
  FactoryBot.create(:empleado, nombre: empleado[:nombre], apellido: empleado[:apellido], cuit: empleado[:cuit])
end

logger.info "Creando cuentas sueldos"
CUENTAS_SUELDOS.each do |cuenta|
  FactoryBot.create(:cuenta_sueldo, nombre: cuenta[:nombre], empleado: Empleado.where(apellido: cuenta[:apellido]).first)
end

logger.info "Creando cuentas y conceptos de gastos"
CONCEPTOS_GASTOS.each do |concepto_gasto|
  concepto = FactoryBot.create(:concepto_gasto, nombre: concepto_gasto)
  FactoryBot.create(:cuenta_gasto, concepto_gasto: concepto, nombre: "Cuenta #{concepto.nombre}")
end

logger.info "Creando gastos en efectivo"
100.times do |_i|
  FactoryBot.create(:mov_gasto)
end
