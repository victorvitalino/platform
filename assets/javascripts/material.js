//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require material/js/bootstrap.min
//= require material/js/jquery.mask.min
//= require material/js/jquery-maskmoney.min
//= require material/vendors/flot/jquery.flot.min
//= require material/vendors/flot/jquery.flot.resize.min
//= require material/vendors/nicescroll/jquery.nicescroll.min
//= require material/vendors/auto-size/jquery.autosize.min
//= require material/vendors/bootstrap-growl/bootstrap-growl.min
//= require redactor-rails
//= require material/js/functions
//= require material/js/demo
//= require material/js/datatables
//= require mod
//= require material/js/custom

window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactor').redactor({
        // You can specify, which ones plugins you need.
        // If you want to use plugins, you have add plugins to your
        // application.js and application.css files and uncomment the line below:
        // "plugins": ['fontsize', 'fontcolor', 'fontfamily', 'fullscreen', 'textdirection', 'clips'],
        "imageUpload":"/redactor_rails/pictures?" + params,
        "imageGetJson":"/redactor_rails/pictures",
        "fileUpload":"/redactor_rails/documents?" + params,
        "fileGetJson":"/redactor_rails/documents",
        "path":"/assets/redactor-rails",
        "css":"style.css"
      });
}

$(document).on( 'ready page:load', window.init_redactor );
