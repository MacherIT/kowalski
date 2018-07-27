require "application_system_test_case"

class CuotasTest < ApplicationSystemTestCase
  setup do
    @cuota = FactoryBot.create(:cuota)
  end

  test "visiting the index" do
    visit cuotas_url
    assert_selector "h1", text: "Cuotas"
  end

  test "creating a Cuota" do
    visit cuotas_url
    click_on "New Cuota"

    fill_in "Adquisicion", with: @cuota.adquisicion_id
    fill_in "Fecha Vencimiento", with: @cuota.fecha_vencimiento
    fill_in "Monto", with: @cuota.monto
    click_on "Create Cuota"

    assert_text "Cuota fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Cuota" do
    visit cuotas_url
    click_on "Edit", match: :first

    fill_in "Adquisicion", with: @cuota.adquisicion_id
    fill_in "Fecha Vencimiento", with: @cuota.fecha_vencimiento
    fill_in "Monto", with: @cuota.monto
    click_on "Update Cuota"

    assert_text "Cuota fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Cuota" do
    visit cuotas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cuota fue eliminado satisfactoriamente"
  end
end
