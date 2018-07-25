$(document).on 'turbolinks:load', ->
  # Cambios en select de tipo de cuenta débito
  $('#movimiento_cuenta_debito_type').on 'change', (event) ->

    # Elimina la selección actual del select
    $('#movimiento_cuenta_debito_id')[0].value = ''

    # Esconde todas las opciones
    $('.option_cuenta_debito').addClass('hidden')

    # Muestra solo las del tipo correspondiente
    tipo = event.target.value.toSnakeCase();
    options = $('.' + tipo)
    options.removeClass('hidden')

    # Cambios en select de tipo de cuenta crédito
  $('#movimiento_cuenta_credito_type').on 'change', (event) ->

    # Elimina la selección actual del select
    $('#movimiento_cuenta_credito_id')[0].value = ''

    # Esconde todas las opciones
    $('.option_cuenta_credito').addClass('hidden')

    # Muestra solo las del tipo correspondiente
    tipo = event.target.value.toSnakeCase();
    options = $('.' + tipo)
    options.removeClass('hidden')


# camelize = (str) ->
#   return str.replace /\W+(.)/g, (match, chr) ->
#     return chr.toUpperCase();
