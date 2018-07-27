# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_27_124338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adquisiciones", force: :cascade do |t|
    t.decimal "precio", default: "0.0", null: false
    t.string "comentarios"
    t.integer "tipo_pago", default: 0, null: false
    t.date "inicio"
    t.date "fin"
    t.bigint "empresa_id", null: false
    t.bigint "producto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_adquisiciones_on_empresa_id"
    t.index ["producto_id"], name: "index_adquisiciones_on_producto_id"
  end

  create_table "conceptos_gastos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuentas_clientes", force: :cascade do |t|
    t.bigint "empresa_id"
    t.string "nombre", default: "f"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_cuentas_clientes_on_empresa_id"
    t.index ["nombre"], name: "index_cuentas_clientes_on_nombre"
  end

  create_table "cuentas_gastos", force: :cascade do |t|
    t.bigint "concepto_gasto_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concepto_gasto_id"], name: "index_cuentas_gastos_on_concepto_gasto_id"
  end

  create_table "cuentas_propias", force: :cascade do |t|
    t.bigint "dueno_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dueno_id"], name: "index_cuentas_propias_on_dueno_id"
  end

  create_table "cuentas_proveedores", force: :cascade do |t|
    t.bigint "empresa_id"
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_cuentas_proveedores_on_empresa_id"
    t.index ["nombre"], name: "index_cuentas_proveedores_on_nombre"
  end

  create_table "cuentas_sueldos", force: :cascade do |t|
    t.bigint "empleado_id"
    t.string "nombre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_cuentas_sueldos_on_empleado_id"
  end

  create_table "duenos", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "cuit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre", null: false
    t.integer "cuit_0", default: 0
    t.bigint "cuit_1", default: 0
    t.integer "cuit_2", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cuit_0"], name: "index_empresas_on_cuit_0"
    t.index ["cuit_1"], name: "index_empresas_on_cuit_1"
    t.index ["cuit_2"], name: "index_empresas_on_cuit_2"
    t.index ["nombre"], name: "index_empresas_on_nombre"
  end

  create_table "movimientos", force: :cascade do |t|
    t.string "cuenta_debito_type"
    t.bigint "cuenta_debito_id"
    t.string "cuenta_credito_type"
    t.bigint "cuenta_credito_id"
    t.string "concepto"
    t.date "fecha_supuesta"
    t.date "fecha_efectiva"
    t.boolean "hecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "monto", default: "0.0", null: false
    t.index ["cuenta_credito_type", "cuenta_credito_id"], name: "index_movimientos_on_cuenta_credito_type_and_cuenta_credito_id"
    t.index ["cuenta_debito_type", "cuenta_debito_id"], name: "index_movimientos_on_cuenta_debito_type_and_cuenta_debito_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre", default: "", null: false
    t.decimal "precio_default"
    t.integer "tipo_pago_default", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nombre"], name: "index_productos_on_nombre"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adquisiciones", "empresas"
  add_foreign_key "adquisiciones", "productos"
  add_foreign_key "cuentas_clientes", "empresas"
  add_foreign_key "cuentas_gastos", "conceptos_gastos"
  add_foreign_key "cuentas_propias", "duenos"
  add_foreign_key "cuentas_proveedores", "empresas"
  add_foreign_key "cuentas_sueldos", "empleados"
end
