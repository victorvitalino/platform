window.init_redactor = function(){
  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
      params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }
  $('.redactorbox').redactor({
    "imageUpload":"/redactor_rails/pictures?" + params,
    "imageGetJson":"/redactor_rails/pictures",
    "fileUpload":"/redactor_rails/documents?" + params,
    "fileGetJson":"/redactor_rails/documents",
    "path":"/assets/redactor-rails",
    "css":"style.css",
    plugins: ['table']

  });
}

$(document).ready(window.init_redactor);
