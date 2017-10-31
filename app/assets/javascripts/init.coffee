$(document).on 'ready turbolinks:load', ->
  $('.modal').modal();
  $('.button-collapse').sideNav();
  $('select').material_select();
  $('ul.tabs').tabs('select_tab', 'tab_id');
  $('#header-dropdown').dropdown({
    constrainWidth: true,
    belowOrigin: true,
  });
  Materialize.updateTextFields();
  Waves.displayEffect()