# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Non_negative = (input_value, minimum_value = 1) ->
  if Math.abs(input_value) == 0 then minimum_value else Math.abs(input_value)
