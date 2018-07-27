require "test_helper"

class AdquisicionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adquisicion = FactoryBot.create(:adquisicion)
  end

  test "should get index" do
    get adquisiciones_url
    assert_response :success
  end

  test "should get new" do
    get new_adquisicion_url
    assert_response :success
  end

  test "should create adquisicion" do
    assert_difference("Adquisicion.count") do
      post adquisiciones_url, params: { adquisicion: { comentarios: @adquisicion.comentarios, empresa_id: @adquisicion.empresa_id, fin: @adquisicion.fin, inicio: @adquisicion.inicio, precio: @adquisicion.precio, producto_id: @adquisicion.producto_id, tipo_pago: @adquisicion.tipo_pago } }
    end

    assert_redirected_to adquisicion_url(Adquisicion.last)
  end

  test "should show adquisicion" do
    get adquisicion_url(@adquisicion)
    assert_response :success
  end

  test "should get edit" do
    get edit_adquisicion_url(@adquisicion)
    assert_response :success
  end

  test "should update adquisicion" do
    patch adquisicion_url(@adquisicion), params: { adquisicion: { comentarios: @adquisicion.comentarios, empresa_id: @adquisicion.empresa_id, fin: @adquisicion.fin, inicio: @adquisicion.inicio, precio: @adquisicion.precio, producto_id: @adquisicion.producto_id, tipo_pago: @adquisicion.tipo_pago } }
    assert_redirected_to adquisicion_url(@adquisicion)
  end

  test "should destroy adquisicion" do
    assert_difference("Adquisicion.count", -1) do
      delete adquisicion_url(@adquisicion)
    end

    assert_redirected_to adquisiciones_url
  end
end
