require "test_helper"

class CuotasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuota = FactoryBot.create(:cuota)
  end

  test "should get index" do
    get cuotas_url
    assert_response :success
  end

  test "should get new" do
    get new_cuota_url
    assert_response :success
  end

  test "should create cuota" do
    assert_difference("Cuota.count") do
      post cuotas_url, params: { cuota: { adquisicion_id: @cuota.adquisicion_id, fecha_vencimiento: @cuota.fecha_vencimiento, monto: @cuota.monto } }
    end

    assert_redirected_to cuota_url(Cuota.last)
  end

  test "should show cuota" do
    get cuota_url(@cuota)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuota_url(@cuota)
    assert_response :success
  end

  test "should update cuota" do
    patch cuota_url(@cuota), params: { cuota: { adquisicion_id: @cuota.adquisicion_id, fecha_vencimiento: @cuota.fecha_vencimiento, monto: @cuota.monto } }
    assert_redirected_to cuota_url(@cuota)
  end

  test "should destroy cuota" do
    assert_difference("Cuota.count", -1) do
      delete cuota_url(@cuota)
    end

    assert_redirected_to cuotas_url
  end
end
