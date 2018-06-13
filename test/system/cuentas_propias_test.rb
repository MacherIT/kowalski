require "application_system_test_case"

class CuentaPropiasTest < ApplicationSystemTestCase
  setup do
    @cuenta_propia = FactoryBot.create(:cuenta_propia)
  end

  test "visiting the index" do
    visit cuentas_propias_url
    assert_selector "h1", text: "Cuenta Propias"
  end

  test "creating a Cuenta propia" do
    visit cuentas_propias_url
    click_on "New Cuenta Propia"

    fill_in "Dueno", with: @cuenta_propia.dueno_id
    fill_in "Nombre", with: @cuenta_propia.nombre
    click_on "Create Cuenta propia"

    assert_text "Cuenta propia fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Cuenta propia" do
    visit cuentas_propias_url
    click_on "Edit", match: :first

    fill_in "Dueno", with: @cuenta_propia.dueno_id
    fill_in "Nombre", with: @cuenta_propia.nombre
    click_on "Update Cuenta propia"

    assert_text "Cuenta propia fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Cuenta propia" do
    visit cuentas_propias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuenta propia fue eliminado satisfactoriamente"
  end
end
