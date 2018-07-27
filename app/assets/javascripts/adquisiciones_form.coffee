$(document).on 'turbolinks:load', ->

  # Al comienzo queda
  select_tipo = $("option:selected", '#adquisicion_tipo_pago')
  if(select_tipo.length)
    tipo = select_tipo.html().toLowerCase()
    $('.cuotas_pago').addClass('hidden')
    $('#cuotas_pago_' + tipo).removeClass('hidden')

    # Cuando se elige un producto, cambia al precio correspondiente
    $('#adquisicion_producto_id').on 'change', (event) ->
      precio = $("option:selected", this).data('precio')
      $('#adquisicion_precio').attr('value', precio)

    # Cuando se cambia el tipo de pago, cambia el form de cuotas
    $('#adquisicion_tipo_pago').on 'change', (event) ->
      tipo = $("option:selected", this).html().toLowerCase()
      $('.cuotas_pago').addClass('hidden')
      $('#cuotas_pago_' + tipo).removeClass('hidden')
