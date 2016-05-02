$(document).ready(function(){
  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "00:00"});
  $('.cnpj').mask("00.000.000/0000-00", {placeholder: "00.000.000/0000-00"});
  $('.cpf').mask("000.000.000-00", {placeholder: "000.000.000-00"});
});