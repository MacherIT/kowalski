require "application_system_test_case"

class DuenosTest < ApplicationSystemTestCase
  setup do
    @dueno = FactoryBot.create(:dueno)
  end

  test "visiting the index" do
    visit duenos_url
    assert_selector "h1", text: "Duenos"
  end

  test "creating a Dueno" do
    visit duenos_url
    click_on "New Dueno"

    fill_in "Nombre", with: @dueno.nombre
    click_on "Create Dueno"

    assert_text "Dueno fue creado satisfactoriamente"
    click_on "Back"
  end

  test "updating a Dueno" do
    visit duenos_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @dueno.nombre
    click_on "Update Dueno"

    assert_text "Dueno fue guardado satisfactoriamente"
    click_on "Back"
  end

  test "destroying a Dueno" do
    visit duenos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dueno fue eliminado satisfactoriamente"
  end
end
