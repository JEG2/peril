# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '#answer', (event) ->
    $(this).hide()
    $('#question').css('display', 'table-cell')

  $(document).on 'click', '#question', (event) ->
    old_path = window.location.pathname
    new_path = old_path.replace /(\/[^\/]+).+/, (_mat, game_slug, _org, _off) ->
      game_slug
    window.location.href = new_path
