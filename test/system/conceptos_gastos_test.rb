require "application_system_test_case"

class ConceptoGastosTest < ApplicationSystemTestCase
  setup do
    @concepto_gasto = FactoryBot.create(:concepto_gasto)
  end

  test "visiting the index" do
    visit conceptos_gastos_url
    assert_selector "h1", text: "Concepto Gastos"
  end

  test "creating a Concepto gasto" do
    visit conceptos_gastos_url
    click_on "New Concepto Gasto"

    fill_in "Nombre", with: @concepto_gasto.nombre
    click_on "Create Concepto gasto"

    assert_text "Concepto gasto fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Concepto gasto" do
    visit conceptos_gastos_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @concepto_gasto.nombre
    click_on "Update Concepto gasto"

    assert_text "Concepto gasto fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Concepto gasto" do
    visit conceptos_gastos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Concepto gasto fue eliminado satisfactoriamente"
  end
end
