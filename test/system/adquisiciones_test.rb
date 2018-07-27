require "application_system_test_case"

class AdquisicionesTest < ApplicationSystemTestCase
  setup do
    @adquisicion = FactoryBot.create(:adquisicion)
  end

  test "visiting the index" do
    visit adquisiciones_url
    assert_selector "h1", text: "Adquisiciones"
  end

  test "creating a Adquisicion" do
    visit adquisiciones_url
    click_on "New Adquisicion"

    fill_in "Comentarios", with: @adquisicion.comentarios
    fill_in "Empresa", with: @adquisicion.empresa_id
    fill_in "Fin", with: @adquisicion.fin
    fill_in "Inicio", with: @adquisicion.inicio
    fill_in "Precio", with: @adquisicion.precio
    fill_in "Producto", with: @adquisicion.producto_id
    fill_in "Tipo Pago", with: @adquisicion.tipo_pago
    click_on "Create Adquisicion"

    assert_text "Adquisicion fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Adquisicion" do
    visit adquisiciones_url
    click_on "Edit", match: :first

    fill_in "Comentarios", with: @adquisicion.comentarios
    fill_in "Empresa", with: @adquisicion.empresa_id
    fill_in "Fin", with: @adquisicion.fin
    fill_in "Inicio", with: @adquisicion.inicio
    fill_in "Precio", with: @adquisicion.precio
    fill_in "Producto", with: @adquisicion.producto_id
    fill_in "Tipo Pago", with: @adquisicion.tipo_pago
    click_on "Update Adquisicion"

    assert_text "Adquisicion fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Adquisicion" do
    visit adquisiciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adquisicion fue eliminado satisfactoriamente"
  end
end
