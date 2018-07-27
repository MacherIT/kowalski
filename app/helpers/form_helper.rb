module FormHelper
  def tipos_pago_for_form
    TIPOS_PAGO.map { |k, v| [k.capitalize, v] }
    # [["Contado", CONTADO], ["Cuotas", CUOTAS]]
  end
end
