require "test_helper"

class MovimientoTest < ActiveSupport::TestCase
  test "se crea un gasto desde una cuenta propia hacia una de gasto" do
    @cuenta_debito = FactoryBot.create(:cuenta_propia)
    @cuenta_credito = FactoryBot.create(:cuenta_gasto)
    assert_difference("@cuenta_debito.debitos.count", 1) do
      assert_difference("@cuenta_credito.creditos.count", 1) do
        @mov = Movimiento.create(cuenta_credito: @cuenta_credito,
                                 cuenta_debito: @cuenta_debito, monto: 100)
        assert @mov.valid?
      end
    end
  end
end
