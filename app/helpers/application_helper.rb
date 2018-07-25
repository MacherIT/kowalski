module ApplicationHelper
  # Genera un array con los parametros para crear options con todas las cuentas
  def cuentas_options_for_select(tipo)
    throw "Error" unless %w[debito credito].include? tipo

    cuentas_propias = CuentaPropia.options_for_select(tipo)
    cuentas_gastos = CuentaGasto.options_for_select(tipo, "hidden")
    cuentas_sueldos = CuentaSueldo.options_for_select(tipo, "hidden")

    cuentas_propias + cuentas_gastos + cuentas_sueldos
  end
end
