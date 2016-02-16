$(document).ready(function(){
  
  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "00:00"});
  $('.coin_mask').maskMoney({prefix:'R$ ', allowNegative: true,allowZero:true, thousands:'', decimal:'.', affixesStay: false});

  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });

  $('.carousel').carousel();

  $("#state_id").on('change', function(){

      $.getJSON("/endereco/city?state_id=" + $(this).val(), function(data) {
        html = "<option value>selecione...</option>"
        if(data.length > 0) {
          for(var i = 0; i < data.length; i++) {
            html += "<option value='"+data[i].id+"'>"+data[i].name+"</option>"
          }

        } else {
          html = "<option value>Não foram encontradas cidades</option>"
        }

        $("#city_id").html(html);
      });
    });

    $("#second_state_id").on('change', function(){

      $.getJSON("/endereco/city?state_id=" + $(this).val(), function(data) {
        html = "<option value>selecione...</option>"
        if(data.length > 0) {
          for(var i = 0; i < data.length; i++) {
            html += "<option value='"+data[i].id+"'>"+data[i].name+"</option>"
          }

        } else {
          html = "<option value>Não foram encontradas cidades</option>"
        }

        $("#second_city_id").html(html);
      });
    });


    $('#station_id').on('change', function() {
      $.getJSON("/atendimento/counters?station_id=" + $(this).val(), function(data) {
        var items = '<option value>Não víncular guichê</option>';
       
        for(var i = 0; i < data.length; i++) {
          items += "<option value='"+ data[i].id +"'>"+data[i].number+"</option>";
        }

        $('#counter_id').html(items);
      });
    });



});