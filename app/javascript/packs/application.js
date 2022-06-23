// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "jquery";
import "bootstrap";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

window.scroll_bottom = function () {
  if ($("#message-container").length > 0) {
    $("#message-container").scrollTop($("#message-container")[0].scrollHeight);
  }
};

window.submit_message = function () {
  $("#message_body").on("keydown", function (e) {
    if (e.keyCode == 13) {
      $("button").click();
      e.target.value = "";
    }
  });
};

$(document).on("turbolinks:load", function () {
  submit_message();
  scroll_bottom();
});
