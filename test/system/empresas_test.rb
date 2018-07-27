require "application_system_test_case"

class EmpresasTest < ApplicationSystemTestCase
  setup do
    @empresa = FactoryBot.create(:empresa)
  end

  test "visiting the index" do
    visit empresas_url
    assert_selector "h1", text: "Empresas"
  end

  test "creating a Empresa" do
    visit empresas_url
    click_on "New Empresa"

    fill_in "Cuit 0", with: @empresa.cuit_0
    fill_in "Cuit 1", with: @empresa.cuit_1
    fill_in "Cuit 2", with: @empresa.cuit_2
    fill_in "Nombre", with: @empresa.nombre
    click_on "Create Empresa"

    assert_text "Empresa fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Empresa" do
    visit empresas_url
    click_on "Edit", match: :first

    fill_in "Cuit 0", with: @empresa.cuit_0
    fill_in "Cuit 1", with: @empresa.cuit_1
    fill_in "Cuit 2", with: @empresa.cuit_2
    fill_in "Nombre", with: @empresa.nombre
    click_on "Update Empresa"

    assert_text "Empresa fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Empresa" do
    visit empresas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empresa fue eliminado satisfactoriamente"
  end
end
