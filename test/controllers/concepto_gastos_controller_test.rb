require "test_helper"

class ConceptoGastosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concepto_gasto = FactoryBot.create(:concepto_gasto)
  end

  test "should get index" do
    get conceptos_gastos_url
    assert_response :success
  end

  test "should get new" do
    get new_concepto_gasto_url
    assert_response :success
  end

  test "should create concepto_gasto" do
    assert_difference("ConceptoGasto.count") do
      post conceptos_gastos_url, params: { concepto_gasto: { nombre: @concepto_gasto.nombre } }
    end

    assert_redirected_to concepto_gasto_url(ConceptoGasto.last)
  end

  test "should show concepto_gasto" do
    get concepto_gasto_url(@concepto_gasto)
    assert_response :success
  end

  test "should get edit" do
    get edit_concepto_gasto_url(@concepto_gasto)
    assert_response :success
  end

  test "should update concepto_gasto" do
    patch concepto_gasto_url(@concepto_gasto), params: { concepto_gasto: { nombre: @concepto_gasto.nombre } }
    assert_redirected_to concepto_gasto_url(@concepto_gasto)
  end

  test "should destroy concepto_gasto" do
    assert_difference("ConceptoGasto.count", -1) do
      delete concepto_gasto_url(@concepto_gasto)
    end

    assert_redirected_to conceptos_gastos_url
  end
end
