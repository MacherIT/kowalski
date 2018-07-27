$(document).on 'turbolinks:load', ->

  # Cuando se elige un producto, cambia al precio correspondiente
  $('#adquisicion_producto_id').on 'change', (event) ->
    precio = $("option:selected", this).data('precio')
    $('#adquisicion_precio').attr('value', precio)
