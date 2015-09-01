$(document).ready(function(){
  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "00:00"});

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
});