# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', '#intro #safe_screen', (event) ->
    $(this).remove()
    $($('.big_category').get(0)).css('display', 'table-cell')

  $(document).on 'click', '#intro .big_category', (event) ->
    $(this).remove()
    next_category = $('.big_category').get(0)
    if next_category
      $(next_category ).css('display', 'table-cell')
    else
      old_path = window.location.pathname
      new_path = old_path.replace /(\/[^\/]+).+/, (_mat, game_slug, _org, _off) ->
        game_slug
      window.location.href = new_path
