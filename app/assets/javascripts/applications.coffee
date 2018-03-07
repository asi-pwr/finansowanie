# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sum_amounts = (applied, other) ->
  a = parseFloat applied
  b = parseFloat other
  a + b

$ ->
  $("#application_amount_applied_for").on 'change', ->
    sum = sum_amounts $("#application_amount_applied_for").val(),
      $("#application_amount_other_sources").val()
    $("#application_amount_overall").val sum

  $("#application_amount_other_sources").on 'change', ->
    sum = sum_amounts $("#application_amount_applied_for").val(),
      $("#application_amount_other_sources").val()
    $("#application_amount_overall").val sum

Non_negative = (input_value, minimum_value = 1) ->
  if Math.abs(input_value) == 0 then minimum_value else Math.abs(input_value)
