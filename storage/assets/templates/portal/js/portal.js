jQuery(document).ready(function($){
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
