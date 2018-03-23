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
#TODO rename all *_member to *_role
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
  member_role_label.innerHTML += ' Funkcja'
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
  first_name_label.innerHTML += ' Imię'
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
                                      'class': 'form-control numeric integer required' })
  # last name label setup
  set_attributes(last_name_label, { 'class': 'control-label integer required',\
                                      'for': last_name_id })
  # inside of label setup
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  last_name_label.appendChild(abbr)
  last_name_label.innerHTML += ' Nazwisko'
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

add_experience = () ->
  # create row
  row_1 = document.createElement('div')
  row_1.className = 'row'
  # individual name and id attributes for fields
  date = new Date()
  msec = date.getTime()
  project_name_id = 'application_experiences_attributes_0_project_name'.replace('0', msec)
  project_name_name = 'application[experiences_attributes][0][project_name]'.replace('0', msec)
  role_id = 'application_experiences_attributes_0_role'.replace('0', msec)
  role_name = 'application[experiences_attributes][0][role]'.replace('0', msec)
  budget_id = 'application_experiences_attributes_0_budget'.replace('0', msec)
  budget_name = 'application[experiences_attributes][0][budget]'.replace('0', msec)
  #
  #
  # create input fields and set their attributes
  #
  #
  project_name_field = document.createElement('input')
  project_name_label = document.createElement('label')
  # project name field setup
  set_attributes(project_name_field, {'type': 'text', 'id': project_name_id,\
                                      'name': project_name_name,\
                                      'class': 'form-control string required' })
  # project name label setup
  set_attributes(project_name_label, {'class': 'control-label string required',\
                                      'for': project_name_id})
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  project_name_label.appendChild(abbr)
  project_name_label.innerHTML += ' Nazwa Projektu'
  # grouping label and field
  project_name_group = document.createElement('div')
  project_name_group.className = 'form-group string required application_experiences_project_name'
  project_name_group.appendChild(project_name_label)
  project_name_group.appendChild(project_name_field)
  # packing project name into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(project_name_group)
  row_1.appendChild(col_div)
  #
  #
  # create input fields and set their attributes
  #
  #
  role_field = document.createElement('input')
  role_label = document.createElement('label')
  # role field setup
  set_attributes(role_field, {'type': 'text', 'id': role_id,\
                                      'name': role_name,\
                                      'class': 'form-control string required' })
  # role label setup
  set_attributes(role_label, {'class': 'control-label string required',\
                                      'for': role_id})
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  role_label.appendChild(abbr)
  role_label.innerHTML += ' Pełniona funkcja'
  # grouping label and field
  role_group = document.createElement('div')
  role_group.className = 'form-group string required application_experiences_role'
  role_group.appendChild(role_label)
  role_group.appendChild(role_field)
  # packing project name into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(role_group)
  row_1.appendChild(col_div)
  #
  #
  # create input fields and set their attributes
  #
  #
  budget_field = document.createElement('input')
  budget_label = document.createElement('label')
  # project name field setup
  set_attributes(budget_field, {'type': 'number', 'id': budget_id,\
                                      'name': budget_name,\
                                      'class': 'form-control string required' })
  # project name label setup
  set_attributes(project_name_label, {'class': 'control-label string required',\
                                      'for': budget_id})
  abbr = document.createElement('abbr')
  abbr.title = 'required'
  abbr.innerHTML = '*'
  first_name_label.appendChild(abbr)
  first_name_label.innerHTML += ' Nazwa Projektu'
  # grouping label and field
  project_name_group = document.createElement('div')
  project_name_group.className = 'form-group string required application_experiences_project_name'
  project_name_group.appendChild(project_name_label)
  project_name_group.appendChild(project_name_field)
  # packing project name into column
  col_div = document.createElement('div')
  col_div.className = 'col-md-4'
  col_div.appendChild(project_name_group)
  row_1.appendChild(col_div)


add_schedule_item = () ->

new_role_row = (row) ->
  new_row = row.cloneNode(true)
  date = new Date()
  msec = date.getTime()
  # if form generator changes, values below may be subject to change
  member_role_id = 'application_roles_attributes_0_member_role'.replace('0', msec)
  member_role_name = 'application[roles_attributes][0][member_role]'.replace('0', msec)
  first_name_id = 'application_roles_attributes_0_first_name'.replace('0', msec)
  first_name_name = 'application[roles_attributes][0][first_name]'.replace('0', msec)
  last_name_id = 'application_roles_attributes_0_last_name'.replace('0', msec)
  last_name_name = 'application[roles_attributes][0][last_name]'.replace('0', msec)
  # replace role field id's
  member_role_field = new_row.querySelector(\
                                  '#application_roles_attributes_0_member_role' )
  member_role_field.setAttribute('id', member_role_id)
  member_role_field.setAttribute('name', member_role_name)
  member_role_label = new_row.querySelector(\
                          '[for="application_roles_attributes_0_member_role"]' )
  member_role_label.setAttribute('for', member_role_id)
  # replace first name field id's
  first_name_field = new_row.querySelector(\
                                  '#application_roles_attributes_0_first_name')
  first_name_field.setAttribute('id', first_name_id)
  first_name_field.setAttribute('name', first_name_name)
  first_name_label = new_row.querySelector(\
                            '[for="application_roles_attributes_0_first_name"]')
  first_name_label.setAttribute('for', first_name_id)
  # replace last name field id's
  last_name_field = new_row.querySelector(\
                                    '#application_roles_attributes_0_last_name')
  last_name_field.setAttribute('id', last_name_id)
  last_name_field.setAttribute('name', last_name_name)
  last_name_label = new_row.querySelector(\
                            '[for="application_roles_attributes_0_last_name"]' )
  last_name_label.setAttribute('for', last_name_id)

  return new_row

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

  # create copies of rows generated by simple forms
  role_row = document.querySelector('.role_row').cloneNode(true)

  $('#add_member').on 'click', ->
    #add_member()
    new_row = replace_id role_row
    btn = document.getElementById('add_member')
    btn.parentNode.insertBefore(new_row, btn)

  $(document).on 'click', '.remove_row', ->
    this.parentNode.parentNode.remove()
