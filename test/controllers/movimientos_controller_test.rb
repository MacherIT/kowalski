require "test_helper"

class MovimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimiento = FactoryBot.create(:movimiento)
  end

  test "should get index" do
    get movimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_movimiento_url
    assert_response :success
  end

  test "should create movimiento" do
    assert_difference("Movimiento.count") do
      post movimientos_url, params: { movimiento: { concepto: @movimiento.concepto, cuenta_credito_id: @movimiento.cuenta_credito_id, cuenta_debito_id: @movimiento.cuenta_debito_id, fecha_efectiva: @movimiento.fecha_efectiva, fecha_supuesta: @movimiento.fecha_supuesta, hecha: @movimiento.hecha } }
    end

    assert_redirected_to movimiento_url(Movimiento.last)
  end

  test "should show movimiento" do
    get movimiento_url(@movimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimiento_url(@movimiento)
    assert_response :success
  end

  test "should update movimiento" do
    patch movimiento_url(@movimiento), params: { movimiento: { concepto: @movimiento.concepto, cuenta_credito_id: @movimiento.cuenta_credito_id, cuenta_debito_id: @movimiento.cuenta_debito_id, fecha_efectiva: @movimiento.fecha_efectiva, fecha_supuesta: @movimiento.fecha_supuesta, hecha: @movimiento.hecha } }
    assert_redirected_to movimiento_url(@movimiento)
  end

  test "should destroy movimiento" do
    assert_difference("Movimiento.count", -1) do
      delete movimiento_url(@movimiento)
    end

    assert_redirected_to movimientos_url
  end
end
