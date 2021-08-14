let form1=$('addref_form');
alert("On js");
$(document).on('submit', '#addref_form', function(event){
  $.ajax({
      type: form1.attr('method'),
      url: form1.attr('action'),
      data:form1.serialize(),
      success:function(data)
      {
       alert("Referal Added!");
        location.reload();
      },
      error:function()
      {
        alert("Failed to add Referal");
      }
    });
//event.preventDefault();
});