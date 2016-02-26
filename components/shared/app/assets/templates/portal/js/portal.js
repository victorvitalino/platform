$(document).ready(function() {
  var mes = 'Jan';
  var ano = 'segundo_ano';
  var botao = '';
  var botao_ano = '';
  var current = mes;
  var current_ano = ano;
  $('.'+ mes).css('display','block');

  $('.tab-mes span').click(function(){
    botao = $(this).attr('data-mes');
    if(current!=botao){
      $('.s-info').css('display','none');
      $('.'+ botao).css('display','block');
      current = botao;
    }
  });

  $('.'+ ano).css('display','block');

  $('.tab-ano li a span').click(function(){
    botao_ano = $(this).attr('data-ano');
    if(current_ano!=botao_ano){
      $('.flip_ano').css('display','none');
      $('.'+ botao_ano).css('display','block');
      current_ano = botao_ano ;
      if(current_ano == 'primeiro_ano'){
        botao = 'Mai';
        $('.s-info').css('display','none');
        $('.'+ botao).css('display','block');
      }else{
        botao = 'Jan';
        $('.s-info').css('display','none');
        $('.'+ botao).css('display','block');
      }
    }
  });
});

$(document).ready(function() {
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
