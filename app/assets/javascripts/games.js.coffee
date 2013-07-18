# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).keypress (event) ->
    if event.which == 117
      old_path = window.location.pathname
      new_path = old_path + "/undo"
      Turbolinks.visit new_path
