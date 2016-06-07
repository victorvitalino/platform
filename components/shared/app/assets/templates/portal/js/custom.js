$.rails.ajax = function(options) {
  var op;
  op = $.ajax(options);
  return op.done(function(response) {
    if (response.substring(0, 10) !== 'Turbolinks') {
      Turbolinks.clearCache();
      document.documentElement.innerHTML = response;
      Turbolinks.dispatch("turbolinks:load");
      return window.scroll(0, 0);
    }
  });
};