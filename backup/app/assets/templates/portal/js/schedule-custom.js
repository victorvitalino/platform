$(document).ready(function() {

  $("#agenda_schedule_agenda_id").on('change', function(){
    $("#hide").fadeIn()
    getAgenda($(this).val())
  });

  $("#agenda_schedule_date").on('change', function(){
    setHours($(this).val() ,$("#agenda_schedule_agenda_id").val());
  });

  getAgenda($("#agenda_schedule_agenda_id").val());

  
  setHours($("#agenda_schedule_date").val() ,$("#agenda_schedule_agenda_id").val());
});



function getAgenda(id) {
  $.getJSON("/agendamento/info?id=" + id,function(data) {
      if(data.length > 0) {
        var weekend = "0,6"

        // disable weekend
        if(data[0].weekend == true) { weekend = '' }

        $("#agenda_schedule_date").datepicker({
          format: "dd/mm/yyyy",
          language: "pt-BR",
          startDate: data[1],
          daysOfWeekDisabled: weekend,
          autoclose: true,
          endDate: data[2]
        });

        $("#description").html("<i>" + data[0].description + "</i>")
      }
    });
}

function setHours(date, id) {
  $.getJSON("/agendamento/horario?date=" + date +"&id=" + id,function(data) {
   hour = ""
   for(var i = 0; i < data.length; i++) {
     hour += "<option value='"+ data[i] +"'>"+data[i]+"</option>";
   }
   $("#agenda_schedule_hour").html(hour);
  });
}