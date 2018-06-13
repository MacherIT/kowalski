require "test_helper"

class CuentaSueldosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta_sueldo = FactoryBot.create(:cuenta_sueldo)
  end

  test "should get index" do
    get cuentas_sueldos_url
    assert_response :success
  end

  test "should get new" do
    get new_cuenta_sueldo_url
    assert_response :success
  end

  test "should create cuenta_sueldo" do
    assert_difference("CuentaSueldo.count") do
      post cuentas_sueldos_url, params: { cuenta_sueldo: { empleado_id: @cuenta_sueldo.empleado_id, nombre: @cuenta_sueldo.nombre } }
    end

    assert_redirected_to cuenta_sueldo_url(CuentaSueldo.last)
  end

  test "should show cuenta_sueldo" do
    get cuenta_sueldo_url(@cuenta_sueldo)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuenta_sueldo_url(@cuenta_sueldo)
    assert_response :success
  end

  test "should update cuenta_sueldo" do
    patch cuenta_sueldo_url(@cuenta_sueldo), params: { cuenta_sueldo: { empleado_id: @cuenta_sueldo.empleado_id, nombre: @cuenta_sueldo.nombre } }
    assert_redirected_to cuenta_sueldo_url(@cuenta_sueldo)
  end

  test "should destroy cuenta_sueldo" do
    assert_difference("CuentaSueldo.count", -1) do
      delete cuenta_sueldo_url(@cuenta_sueldo)
    end

    assert_redirected_to cuentas_sueldos_url
  end
end
