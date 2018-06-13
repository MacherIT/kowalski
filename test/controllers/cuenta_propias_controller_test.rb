require "test_helper"

class CuentaPropiasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta_propia = FactoryBot.create(:cuenta_propia)
  end

  test "should get index" do
    get cuentas_propias_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenta_propia_url
    assert_response :success
  end

  test "should create cuenta_propia" do
    assert_difference("CuentaPropia.count") do
      post cuentas_propias_url, params: { cuenta_propia: { dueno_id: @cuenta_propia.dueno_id, nombre: @cuenta_propia.nombre } }
    end

    assert_redirected_to cuenta_propia_url(CuentaPropia.last)
  end

  test "should show cuenta_propia" do
    get cuenta_propia_url(@cuenta_propia)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenta_propia_url(@cuenta_propia)
    assert_response :success
  end

  test "should update cuenta_propia" do
    patch cuenta_propia_url(@cuenta_propia), params: { cuenta_propia: { dueno_id: @cuenta_propia.dueno_id, nombre: @cuenta_propia.nombre } }
    assert_redirected_to cuenta_propia_url(@cuenta_propia)
  end

  test "should destroy cuenta_propia" do
    assert_difference("CuentaPropia.count", -1) do
      delete cuenta_propia_url(@cuenta_propia)
    end

    assert_redirected_to cuentas_propias_url
  end
end
