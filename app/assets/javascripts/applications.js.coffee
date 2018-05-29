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
# TODO REFACTORING: rewrite new_*_row functions to match new_experience_row_style
#TODO REFACTORING: rename all *_member to *_role
# takes simple form generated row as an argument and returns a new one with new id
new_experiences_row = (row) ->
  new_row = row.cloneNode(true)
  date = new Date()
  msec = date.getTime()
  # if form generator changes, balues below may also be subject to change
  id_base = 'application_experiences_attributes_0_'
  name_base = 'application[experiences_attributes][0][*]'
  # setup project field
  project_name_id = id_base.concat('project_name')
  project_name_name = name_base.replace('0', msec).replace('*', 'project_name')
  project_name_field = new_row.querySelector('#'.concat(project_name_id))
  project_name_label = new_row.querySelector('[for="'.concat(project_name_id, '"]'))
  project_name_id = project_name_id.replace('0', msec)
  project_name_field.setAttribute('id', project_name_id)
  project_name_field.setAttribute('name', project_name_name)
  project_name_label.setAttribute('for', project_name_id)
  # setup role field
  role_id = id_base.concat('role')
  role_name = name_base.replace('0', msec).replace('*', 'role')
  role_field = new_row.querySelector('#'.concat(role_id))
  role_label = new_row.querySelector('[for="'.concat(role_id, '"]'))
  role_id = role_id.replace('0', msec)
  role_field.setAttribute('id', role_id)
  role_field.setAttribute('name', role_name)
  role_label.setAttribute('for', role_id)
  # setup budget field
  budget_id = id_base.concat('budget')
  budget_name = name_base.replace('0', msec).replace('*', 'budget')
  budget_field = new_row.querySelector('#'.concat(budget_id))
  budget_label = new_row.querySelector('[for="'.concat(budget_id, '"]'))
  budget_id = budget_id.replace('0', msec)
  budget_field.setAttribute('id', budget_id)
  budget_field.setAttribute('name', budget_name)
  budget_label.setAttribute('for', budget_id)
  # setup project date field
  date_fields = ['1i', '2i', '3i']
  for sub in date_fields
    project_date_id = id_base.concat('project_date_', sub)
    project_date_field = new_row.querySelector('#'.concat(project_date_id))
    project_date_id = project_date_id.replace('0', msec)
    project_date_name = name_base.replace('0', msec).replace('*', 'project_date('.concat(sub, ')'))
    project_date_field.setAttribute('id', project_date_id)
    project_date_field.setAttribute('name', project_date_name)
  project_date_label = new_row.querySelector('[for="'.concat(id_base, 'project_date_1i', '"]'))
  project_date_label.setAttribute('for', id_base.concat('project_date').replace('0', msec))
  # setup member name field
  member_name_id = id_base.concat('member_name')
  member_name_name = name_base.replace('0', msec).replace('*', 'member_name')
  member_name_field = new_row.querySelector('#'.concat(member_name_id))
  member_name_label = new_row.querySelector('[for="'.concat(member_name_id, '"]'))
  member_name_id = member_name_id.replace('0', msec)
  member_name_field.setAttribute('id', member_name_id)
  member_name_field.setAttribute('name', member_name_name)
  member_name_label.setAttribute('for', member_name_id)

  return new_row

# takes simple form generated row as an argument and returns a new one with new id
new_schedule_item_row = (row) ->
  new_row = row.cloneNode(true)
  date = new Date()
  msec = date.getTime()
  # if form generator changes, values below may also be subject to change
  todo_id = 'application_schedule_items_attributes_0_todo'.replace('0', msec)
  todo_name = 'application[schedule_items_attributes][0][todo]'.replace('0', msec)
  start_date_id_base = 'application_schedule_items_attributes_0_start_date_*'
  start_date_name_base = 'application[schedule_items_attributes][0][start_date(*)]'
  due_date_id_base = 'application_schedule_items_attributes_0_due_date_*'
  due_date_name_base = 'application[schedule_items_attributes][0][due_date(*)]'
  date_fields = ['1i', '2i', '3i']
  for sub in date_fields
    # start date fields setup
    start_date_id = start_date_id_base.replace('*', sub)
    start_date_field = new_row.querySelector('#'.concat(start_date_id))
    start_date_id = start_date_id.replace('0', msec)
    start_date_name = start_date_name_base.replace('*', sub).replace('0', msec)
    start_date_field.setAttribute('id', start_date_id)
    start_date_field.setAttribute('name', start_date_name)
    # due date fields setup
    due_date_id = due_date_id_base.replace('*', sub)
    due_date_field = new_row.querySelector('#'.concat(due_date_id))
    due_date_id = due_date_id.replace('0', msec)
    due_date_name = due_date_name_base.replace('*', sub).replace('0', msec)
    due_date_field.setAttribute('id', due_date_id)
    due_date_field.setAttribute('name', due_date_name)
  # label setup
  start_date_label = new_row.querySelector('[for="application_schedule_items_attributes_0_start_date_1i"]')
  start_date_label.setAttribute('for', start_date_id_base.replace('0', msec).replace('*', '1i'))
  due_date_label = new_row.querySelector('[for="application_schedule_items_attributes_0_due_date_1i"]')
  due_date_label.setAttribute('for', due_date_id_base.replace('0', msec).replace('*', '1i'))
  # replace todo field id's
  todo_field = new_row.querySelector('#application_schedule_items_attributes_0_todo')
  todo_field.setAttribute('id', todo_id)
  todo_field.setAttribute('name', todo_name)
  todo_label = new_row.querySelector('[for="application_schedule_items_attributes_0_todo"]')
  todo_label.setAttribute('for', todo_id)

  return new_row

# takes simple form generated row as an argument and returns a new one with new id
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
  schedule_items_row = document.querySelector('.schedule_items_row').cloneNode(true)
  experiences_row = document.querySelector('.experiences_row').cloneNode(true)

  $('#add_member').on 'click', ->
    #add_member()
    new_row = new_role_row role_row
    btn = document.getElementById('add_member')
    btn.parentNode.insertBefore(new_row, btn)

  $('#add_schedule_item').on 'click', ->
    new_row = new_schedule_item_row schedule_items_row
    btn = document.getElementById('add_schedule_item')
    btn.parentNode.insertBefore(new_row, btn)

  $('#add_experience').on 'click', ->
    new_row = new_experiences_row experiences_row
    btn = document.getElementById('add_experience')
    btn.parentNode.insertBefore(new_row, btn)

  $(document).on 'click', '.remove_row', ->
    this.parentNode.remove()
