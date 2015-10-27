//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require material/js/custom
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



$(document).on('page:fetch',   function() { NProgress.start(); });
$(document).on('page:change',  function() { NProgress.done(); });
$(document).on('page:restore', function() { NProgress.remove(); });

NProgress.configure({ showSpinner: false });