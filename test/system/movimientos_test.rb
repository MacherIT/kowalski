require "application_system_test_case"

class MovimientosTest < ApplicationSystemTestCase
  setup do
    @movimiento = FactoryBot.create(:movimiento)
  end

  test "visiting the index" do
    visit movimientos_url
    assert_selector "h1", text: "Movimientos"
  end

  test "creating a Movimiento" do
    visit movimientos_url
    click_on "New Movimiento"

    fill_in "Concepto", with: @movimiento.concepto
    fill_in "Cuenta Credito", with: @movimiento.cuenta_credito_id
    fill_in "Cuenta Debito", with: @movimiento.cuenta_debito_id
    fill_in "Fecha Efectiva", with: @movimiento.fecha_efectiva
    fill_in "Fecha Supuesta", with: @movimiento.fecha_supuesta
    fill_in "Hecha", with: @movimiento.hecha
    click_on "Create Movimiento"

    assert_text "Movimiento fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Movimiento" do
    visit movimientos_url
    click_on "Edit", match: :first

    fill_in "Concepto", with: @movimiento.concepto
    fill_in "Cuenta Credito", with: @movimiento.cuenta_credito_id
    fill_in "Cuenta Debito", with: @movimiento.cuenta_debito_id
    fill_in "Fecha Efectiva", with: @movimiento.fecha_efectiva
    fill_in "Fecha Supuesta", with: @movimiento.fecha_supuesta
    fill_in "Hecha", with: @movimiento.hecha
    click_on "Update Movimiento"

    assert_text "Movimiento fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Movimiento" do
    visit movimientos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movimiento fue eliminado satisfactoriamente"
  end
end
