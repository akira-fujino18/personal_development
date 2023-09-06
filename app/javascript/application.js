import "@hotwired/turbo-rails"
import "controllers"
import './jquery'

//= require jquery
$(function() {
  $(".close-button").click(function() {
    $(".error").hide();
  });
});

$(function() {
  $(".close-button").click(function() {
    $(".success").hide();
  });
});