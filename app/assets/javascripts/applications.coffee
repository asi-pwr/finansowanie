# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sum_amounts = (applied, other) ->
  a = parseFloat applied
  b = parseFloat other
  a + b

set_attributes = (el, attrs) ->
  for key, val of attrs
    el.setAttribute(key, val)

add_member = () ->
  # create row
  row = document.createElement('div')
  row.setAttribute('class', 'row')
  # individual name and id attributes for input fields
  date = new Date()
  msec = date.getTime()
  member_role_id = 'application_roles_attributes_0_member_role'.replace('0', msec)
  member_role_name = 'application[roles_attributes][0][member_role]'.replace('0', msec)
  first_name_id = 'application_roles_attributes_0_first_name'.replace('0', msec)
  first_name_name = 'application[roles_attributes][0][first_name]'.replace('0', msec)
  last_name_id = 'application_roles_attributes_0_last_name'.replace('0', msec)
  last_name_name = 'application[roles_attributes][0][last_name]'.replace('0', msec)
  #
  #
  # create input fields and set their attributes
  #
  #
  member_role_field = document.createElement('input')
  member_role_label = document.createElement('label')
  # member role field setup
  set_attributes(member_role_field, { 'type': 'text', 'id': member_role_id,\
                                      'name': member_role_name,\
                                      'class': 'form-control string required' })
  # member role label setup
  set_attributes(member_role_label, { 'class': 'control-label string required',\
                                      'for': member_role_id })
  # inside of label setup
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  member_role_label.appendChild(abbr)
  member_role_label.innerHTML += 'Funkcja'
  # grouping label and field
  member_role_group = document.createElement('div')
  member_role_group.className = 'form-group string required application_roles_member_role'
  member_role_group.appendChild(member_role_label)
  member_role_group.appendChild(member_role_field)
  # packing member role into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(member_role_group)
  row.appendChild(col_div)
  #
  #
  # create input fields and set their attributes
  #
  #
  first_name_field = document.createElement('input')
  first_name_label = document.createElement('label')
  # first name field setup
  set_attributes(first_name_field, { 'type': 'text', 'id': first_name_name,\
                                      'name': first_name_name,\
                                      'class': 'form-control string required' })
  # first name label setup
  set_attributes(first_name_label, { 'class': 'control-label string required',\
                                      'for': first_name_id })
  # inside of label setup
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  first_name_label.appendChild(abbr)
  first_name_label.innerHTML += 'Imię'
  # grouping label and field
  first_name_group = document.createElement('div')
  first_name_group.className = 'form-group string required application_roles_first_name'
  first_name_group.appendChild(first_name_label)
  first_name_group.appendChild(first_name_field)
  # packing first name into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(first_name_group)
  row.appendChild(col_div)
  #
  #
  # create input fields and set their attributes
  #
  #
  last_name_field = document.createElement('input')
  last_name_label = document.createElement('label')
  # last name field setup
  set_attributes(last_name_field, { 'type': 'text', 'id': last_name_id,\
                                      'name': last_name_name,\
                                      'class': 'form-control string required' })
  # last name label setup
  set_attributes(last_name_label, { 'class': 'control-label string required',\
                                      'for': last_name_id })
  # inside of label setup
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  last_name_label.appendChild(abbr)
  last_name_label.innerHTML += 'Nazwisko'
  # grouping label and field
  last_name_group = document.createElement('div')
  last_name_group.className = 'form-group string required' +
                              'application_roles_last_name'
  last_name_group.appendChild(last_name_label)
  last_name_group.appendChild(last_name_field)
  # packing first name into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(last_name_group)
  row.appendChild(col_div)

  # create button
  remove_button = document.createElement('button')
  set_attributes(remove_button, { 'type': 'button',\
                                  'class': 'btn btn-default remove_row'})
  remove_button.innerHTML = 'Usuń'
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(remove_button)
  row.appendChild(col_div)

  add_button = document.getElementById('add_member')
  add_button.parentNode.insertBefore(row, add_button)

$ ->
  # TODO maximum precision, odd behavior with float, for example 0.33
  # sums up as 0.330000000004
  $('#application_amount_applied_for').on 'input', ->
    sum = sum_amounts $('#application_amount_applied_for').val(),
      $('#application_amount_other_sources').val()
    $('#application_amount_overall').val sum

  $('#application_amount_other_sources').on 'input', ->
    sum = sum_amounts $('#application_amount_applied_for').val(),
      $('#application_amount_other_sources').val()
    $('#application_amount_overall').val sum

  $('#add_member').on 'click', ->
    add_member()

  $(document).on 'click', '.remove_row', ->
    this.parentNode.parentNode.remove()
