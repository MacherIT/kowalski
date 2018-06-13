require "application_system_test_case"

class CuentaSueldosTest < ApplicationSystemTestCase
  setup do
    @cuenta_sueldo = FactoryBot.create(:cuenta_sueldo)
  end

  test "visiting the index" do
    visit cuentas_sueldos_url
    assert_selector "h1", text: "Cuenta Sueldos"
  end

  test "creating a Cuenta sueldo" do
    visit cuentas_sueldos_url
    click_on "New Cuenta Sueldo"

    fill_in "Empleado", with: @cuenta_sueldo.empleado_id
    fill_in "Nombre", with: @cuenta_sueldo.nombre
    click_on "Create Cuenta sueldo"

    assert_text "Cuenta sueldo was successfully created"
    click_on "Back"
  end

  test "updating a Cuenta sueldo" do
    visit cuentas_sueldos_url
    click_on "Edit", match: :first

    fill_in "Empleado", with: @cuenta_sueldo.empleado_id
    fill_in "Nombre", with: @cuenta_sueldo.nombre
    click_on "Update Cuenta sueldo"

    assert_text "Cuenta sueldo was successfully updated"
    click_on "Back"
  end

  test "destroying a Cuenta sueldo" do
    visit cuentas_sueldos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuenta sueldo was successfully destroyed"
  end
end
