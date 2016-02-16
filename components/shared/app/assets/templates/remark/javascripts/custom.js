
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

var tiny = $(function() { 
  tinymce.init({
    selector: 'textarea',
    height: 500,
    language: 'pt_BR',
    relative_urls : false,
    document_base_url : "/libs/tinymce/",
    plugins: [
      'advlist autolink lists link image charmap print preview hr anchor pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen',
      'insertdatetime media nonbreaking save table contextmenu directionality',
      'emoticons template paste textcolor colorpicker textpattern imagetools'
    ],
    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print | forecolor backcolor',
    image_advtab: true,
    content_css: [
      '//fast.fonts.net/cssapi/e6dc9b99-64fe-4292-ad98-6974f93cd2a2.css',
      '//www.tinymce.com/css/codepen.min.css'
    ]
  });
});
  
$(window).on('turbolinks:load', tiny)
  
