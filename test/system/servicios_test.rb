require "application_system_test_case"

class ServiciosTest < ApplicationSystemTestCase
  setup do
    @servicio = FactoryBot.create(:servicio)
  end

  test "visiting the index" do
    visit servicios_url
    assert_selector "h1", text: "Servicios"
  end

  test "creating a Servicio" do
    visit servicios_url
    click_on "New Servicio"

    fill_in "Comentarios", with: @servicio.comentarios
    fill_in "Empresa", with: @servicio.empresa_id
    fill_in "Fin", with: @servicio.fin
    fill_in "Inicio", with: @servicio.inicio
    fill_in "Precio", with: @servicio.precio
    click_on "Create Servicio"

    assert_text "Servicio fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Servicio" do
    visit servicios_url
    click_on "Edit", match: :first

    fill_in "Comentarios", with: @servicio.comentarios
    fill_in "Empresa", with: @servicio.empresa_id
    fill_in "Fin", with: @servicio.fin
    fill_in "Inicio", with: @servicio.inicio
    fill_in "Precio", with: @servicio.precio
    click_on "Update Servicio"

    assert_text "Servicio fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Servicio" do
    visit servicios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Servicio fue eliminado satisfactoriamente"
  end
end
