$(document).on 'ready turbolinks:load', ->
  $('.modal').modal();
  $('.button-collapse').sideNav();
  $('select').material_select();
  $('ul.tabs').tabs('select_tab', 'tab_id');
  Materialize.updateTextFields();
  Waves.displayEffect()
  console.log "load init on ready or turbolinks:load"