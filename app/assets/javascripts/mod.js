(function ($) {
  jQuery.expr[':'].Contains = function(a,i,m){
    return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
  };

  function listFilter(header, list) {
  $('.filterinput')
    .change( function () {
    var filter = $(this).val();
    if(filter) {
      $(list).find(".lv-item .media .media-body .lv-title:not(:Contains(" + filter + "))").parent().parent().parent().hide();
      $(list).find(".lv-item .media .media-body .lv-title:Contains(" + filter + ")").parent().parent().parent().show();
    } else {
      $(list).find(".lv-item").show();
    }
    return false;
    })
  .keyup( function () {
    $(this).change();
  });
  }

  $(function () {
  listFilter($("#buscador"), $(".listview"));
  });

  // $('#navsort').sortable({
  //   axis:'y',
  //   update:function(){
  //   console.log($(this).sortable('serialize'))
  //   //  $.post($(this).data('update-url'), $(this).sortable('serialize'))
  //   }
  // });
}(jQuery));
