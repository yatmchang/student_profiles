// })
//$(document).on('page:load',(){
$(document).ready(function(){

  $("#skill-tab").click(function(){
    var profile = $('#skill-tab').data("profileid")
    var user = $("#skill-tab").data("userid")
    $.ajax({
      method: "GET",
      url: "/users/" + user + "/profiles/" + profile + "/skills.json",
      success: function(data){
        console.log(data)
        for (var i = 0; i < data.length; i++) {
          progBar(data[i].rating, data[i].id)
        }

      },
      error: function(){
        alert('no!');
      }
    })
  })

  // @param  {Number} percent
  // @param

  function progBar(percent, id) {
    var width = $("ul.nav-tabs").width();
	  var progressBarWidth = percent * width / 10;
    $("#skill_" + id).animate(
      {width: progressBarWidth }, 500
    ).html();
  }
})


//percent + "%&nbsp;"
