# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ ->
  $('#line_item_plant_id').select2()

  $('span.balance').each (index,span) =>
    amount = parseFloat($(span).first().text().replace('$','')) 
    if (amount > 0)
      $(span).addClass('negative')
