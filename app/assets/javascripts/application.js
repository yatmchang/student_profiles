// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.infinite-pages
//= require jquery.jcrop
// require turbolinks
//= require bootstrap-sprockets
//= require_tree .
// $(document).ready(function(){

//   $("#user-form").hide();

//   $("#account-tab").click(function(){
//     $("#user-form").show();
//   });


// })
//$(document).on('page:load',(){
$(document).ready(function(){
  // ===== Scroll to Top ====
  $(window).scroll(function() {
    if ($(this).scrollTop() >= 50) { // If page is scrolled more than 50px
      $('#return-to-top').fadeIn(200); // Fade in the arrow
    } else {
      $('#return-to-top').fadeOut(200); // Else fade out the arrow
    }
  });
  $('#return-to-top').click(function() { // When arrow is clicked
    $('body,html').animate({
      scrollTop: 0 // Scroll to top of body
    }, 500);
  });

  $("span.admin").click(function(){$(this).hide()})

  $(".edu-del-link").click(function(){
    var user = $(this).data("user");
    var profile = $(this).data("profile");
    var education = $(this).data("id");
    var that = $(this);
    console.log('/users/' + user + "/" + profile + "/" + education);
    $.ajax({
      method: "DELETE",
      url: '/users/' + user + "/profiles/" + profile + "/educations/" + education + ".json",
      error: function(){
        alert("nope");
      },
      success: function(){
        that.fade(500);
      }
    })
  }) 

  $(".edu-edit-link").click(function(){
      var user = $(this).data("user");
      var profile = $(this).data("profile");
      var education = $(this).data("id");
      var that = $(this);
      console.log('/users/' + user + "/" + profile + "/" + education);
      // toggle modal here
      $("#hook-point").append(
        "<input id='input-1' type='text'><br><input id='date-1' type='date'><br><input id='date-2' type='date'><br><input id='input-2' type='text'><br><input id='submit' type='submit'>"
      );
      $("#edit-modal").modal("toggle")

      $.ajax({
        method: "PATCH",
        url: '/users/' + user + "/profiles/" + profile + "/educations/" + education + ".json",
        error: function(){
          alert("nope");
        },
        success: function(){
          alert("edit")
        }
      })
    }) 























});
