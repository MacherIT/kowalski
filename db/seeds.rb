# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

logger = Logger.new(STDOUT)

logger.info "Usuarios"
FactoryBot.create(:user, email: "bruno.calmels@macherit.com", password: "macherito")

logger.info "Dueños"
DUENOS.each do |dueno|
  FactoryBot.create(:dueno, nombre: dueno)
end

logger.info "Cuentas propias"
CUENTAS_PROPIAS.each do |cuenta|
  FactoryBot.create(:cuenta_propia, nombre: cuenta[:nombre], dueno: Dueno.where(nombre: cuenta[:dueno]).first)
end

logger.info "Empleados"
EMPLEADOS.each do |empleado|
  FactoryBot.create(:empleado, nombre: empleado[:nombre], apellido: empleado[:apellido], cuit: empleado[:cuit])
end

logger.info "Cuentas sueldos"
CUENTAS_SUELDOS.each do |cuenta|
  FactoryBot.create(:cuenta_sueldo, nombre: cuenta[:nombre], empleado: Empleado.where(apellido: cuenta[:apellido]).first)
end

logger.info "Cuentas y conceptos de gastos"
CONCEPTOS_GASTOS.each do |concepto_gasto|
  concepto = FactoryBot.create(:concepto_gasto, nombre: concepto_gasto)
  FactoryBot.create(:cuenta_gasto, concepto_gasto: concepto, nombre: "Cuenta #{concepto.nombre}")
end

logger.info "Gastos en efectivo"
100.times do |_i|
  FactoryBot.create(:mov_gasto)
end

logger.info "Empresas proveedoras"
PROVEEDORES.each do |prov|
  proveedor = FactoryBot.create(:empresa, nombre: prov)
  FactoryBot.create(:cuenta_proveedor, empresa: proveedor, nombre: "Cuenta de " + proveedor.nombre)
end
