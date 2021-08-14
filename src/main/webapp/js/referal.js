$(document).ready(function()
{
$.ajax({


				url: 'showReferal',
                type: 'POST',
                success: function(data){
                    //If the success function is executed,
                    //then the Ajax request was successful.
                    //Add the data we received in our Ajax
                    //request to the "content" div.
                    $('#profile-main').html(data);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    var errorMsg = 'Ajax request failed: ' + xhr.responseText;
                    $('#content').html(errorMsg);
                  }


});
});

