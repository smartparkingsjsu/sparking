$(document).on 'ready turbolinks:load', ->
  $('.modal').modal();
  $('.button-collapse').sideNav();
  $('select').material_select();
  Waves.displayEffect()
  console.log "load init on ready or turbolinks:load"