require "application_system_test_case"

class CuentaGastosTest < ApplicationSystemTestCase
  setup do
    @cuenta_gasto = FactoryBot.create(:cuenta_gasto)
  end

  test "visiting the index" do
    visit cuentas_gastos_url
    assert_selector "h1", text: "Cuenta Gastos"
  end

  test "creating a Cuenta gasto" do
    visit cuentas_gastos_url
    click_on "New Cuenta Gasto"

    fill_in "Concepto Gasto", with: @cuenta_gasto.concepto_gasto_id
    fill_in "Nombre", with: @cuenta_gasto.nombre
    click_on "Create Cuenta gasto"

    assert_text "Cuenta gasto fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Cuenta gasto" do
    visit cuentas_gastos_url
    click_on "Edit", match: :first

    fill_in "Concepto Gasto", with: @cuenta_gasto.concepto_gasto_id
    fill_in "Nombre", with: @cuenta_gasto.nombre
    click_on "Update Cuenta gasto"

    assert_text "Cuenta gasto fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Cuenta gasto" do
    visit cuentas_gastos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuenta gasto fue eliminado satisfactoriamente"
  end
end
