$(document).on 'ready turbolinks:load', ->
  $('.modal').modal();
  Waves.displayEffect()
  console.log "load init on ready or turbolinks:load"