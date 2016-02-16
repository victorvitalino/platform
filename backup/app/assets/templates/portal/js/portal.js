$(document).on('turbolinks:load', function() {
  var mes = 'Mai';
  var botao = '';
  var current = mes;
  $('#'+ mes).css('display','block');

  $('.tab-mes span').click(function(){
    botao = $(this).attr('data-mes');
    if(current!=botao){
      $('.s-info').css('display','none');
      $('#'+ botao).css('display','block');
      current = botao;
    }
  });
});



jQuery(function() {
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  return $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});