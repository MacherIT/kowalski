require "test_helper"

class DuenosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dueno = FactoryBot.create(:dueno)
  end

  test "should get index" do
    get duenos_url
    assert_response :success
  end

  test "should get new" do
    get new_dueno_url
    assert_response :success
  end

  test "should create dueno" do
    assert_difference("Dueno.count") do
      post duenos_url, params: { dueno: { nombre: @dueno.nombre } }
    end

    assert_redirected_to dueno_url(Dueno.last)
  end

  test "should show dueno" do
    get dueno_url(@dueno)
    assert_response :success
  end

  test "should get edit" do
    get edit_dueno_url(@dueno)
    assert_response :success
  end

  test "should update dueno" do
    patch dueno_url(@dueno), params: { dueno: { nombre: @dueno.nombre } }
    assert_redirected_to dueno_url(@dueno)
  end

  test "should destroy dueno" do
    assert_difference("Dueno.count", -1) do
      delete dueno_url(@dueno)
    end

    assert_redirected_to duenos_url
  end
end
