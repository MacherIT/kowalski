require "test_helper"

class CuentaGastosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta_gasto = FactoryBot.create(:cuenta_gasto)
  end

  test "should get index" do
    get cuentas_gastos_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenta_gasto_url
    assert_response :success
  end

  test "should create cuenta_gasto" do
    assert_difference("CuentaGasto.count") do
      post cuentas_gastos_url, params: { cuenta_gasto: { concepto_gasto_id: @cuenta_gasto.concepto_gasto_id, nombre: @cuenta_gasto.nombre } }
    end

    assert_redirected_to cuenta_gasto_url(CuentaGasto.last)
  end

  test "should show cuenta_gasto" do
    get cuenta_gasto_url(@cuenta_gasto)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenta_gasto_url(@cuenta_gasto)
    assert_response :success
  end

  test "should update cuenta_gasto" do
    patch cuenta_gasto_url(@cuenta_gasto), params: { cuenta_gasto: { concepto_gasto_id: @cuenta_gasto.concepto_gasto_id, nombre: @cuenta_gasto.nombre } }
    assert_redirected_to cuenta_gasto_url(@cuenta_gasto)
  end

  test "should destroy cuenta_gasto" do
    assert_difference("CuentaGasto.count", -1) do
      delete cuenta_gasto_url(@cuenta_gasto)
    end

    assert_redirected_to cuentas_gastos_url
  end
end
