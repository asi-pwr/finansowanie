var new_experiences_row, new_role_row, new_schedule_item_row, set_attributes, sum_amounts;

sum_amounts = function(applied, other) {
  var a, b;
  a = parseFloat(applied);
  b = parseFloat(other);
  return a + b;
};

set_attributes = function(el, attrs) {
  var key, results, val;
  results = [];
  for (key in attrs) {
    val = attrs[key];
    results.push(el.setAttribute(key, val));
  }
  return results;
};

new_experiences_row = function(row) {
  var budget_field, budget_id, budget_label, budget_name, date, date_fields, i, id_base, len, member_name_field, member_name_id, member_name_label, member_name_name, msec, name_base, new_row, project_date_field, project_date_id, project_date_label, project_date_name, project_name_field, project_name_id, project_name_label, project_name_name, role_field, role_id, role_label, role_name, sub;
  new_row = row.cloneNode(true);
  date = new Date();
  msec = date.getTime();
  id_base = 'application_experiences_attributes_0_';
  name_base = 'application[experiences_attributes][0][*]';
  project_name_id = id_base.concat('project_name');
  project_name_name = name_base.replace('0', msec).replace('*', 'project_name');
  project_name_field = new_row.querySelector('#'.concat(project_name_id));
  project_name_label = new_row.querySelector('[for="'.concat(project_name_id, '"]'));
  project_name_id = project_name_id.replace('0', msec);
  project_name_field.setAttribute('id', project_name_id);
  project_name_field.setAttribute('name', project_name_name);
  project_name_label.setAttribute('for', project_name_id);
  role_id = id_base.concat('role');
  role_name = name_base.replace('0', msec).replace('*', 'role');
  role_field = new_row.querySelector('#'.concat(role_id));
  role_label = new_row.querySelector('[for="'.concat(role_id, '"]'));
  role_id = role_id.replace('0', msec);
  role_field.setAttribute('id', role_id);
  role_field.setAttribute('name', role_name);
  role_label.setAttribute('for', role_id);
  budget_id = id_base.concat('budget');
  budget_name = name_base.replace('0', msec).replace('*', 'budget');
  budget_field = new_row.querySelector('#'.concat(budget_id));
  budget_label = new_row.querySelector('[for="'.concat(budget_id, '"]'));
  budget_id = budget_id.replace('0', msec);
  budget_field.setAttribute('id', budget_id);
  budget_field.setAttribute('name', budget_name);
  budget_label.setAttribute('for', budget_id);
  date_fields = ['1i', '2i', '3i'];
  for (i = 0, len = date_fields.length; i < len; i++) {
    sub = date_fields[i];
    project_date_id = id_base.concat('project_date_', sub);
    project_date_field = new_row.querySelector('#'.concat(project_date_id));
    project_date_id = project_date_id.replace('0', msec);
    project_date_name = name_base.replace('0', msec).replace('*', 'project_date('.concat(sub, ')'));
    project_date_field.setAttribute('id', project_date_id);
    project_date_field.setAttribute('name', project_date_name);
  }
  project_date_label = new_row.querySelector('[for="'.concat(id_base, 'project_date_1i', '"]'));
  project_date_label.setAttribute('for', id_base.concat('project_date').replace('0', msec));
  member_name_id = id_base.concat('member_name');
  member_name_name = name_base.replace('0', msec).replace('*', 'member_name');
  member_name_field = new_row.querySelector('#'.concat(member_name_id));
  member_name_label = new_row.querySelector('[for="'.concat(member_name_id, '"]'));
  member_name_id = member_name_id.replace('0', msec);
  member_name_field.setAttribute('id', member_name_id);
  member_name_field.setAttribute('name', member_name_name);
  member_name_label.setAttribute('for', member_name_id);
  return new_row;
};

new_schedule_item_row = function(row) {
  var date, date_fields, due_date_field, due_date_id, due_date_id_base, due_date_label, due_date_name, due_date_name_base, i, len, msec, new_row, start_date_field, start_date_id, start_date_id_base, start_date_label, start_date_name, start_date_name_base, sub, todo_field, todo_id, todo_label, todo_name;
  new_row = row.cloneNode(true);
  date = new Date();
  msec = date.getTime();
  todo_id = 'application_schedule_items_attributes_0_todo'.replace('0', msec);
  todo_name = 'application[schedule_items_attributes][0][todo]'.replace('0', msec);
  start_date_id_base = 'application_schedule_items_attributes_0_start_date_*';
  start_date_name_base = 'application[schedule_items_attributes][0][start_date(*)]';
  due_date_id_base = 'application_schedule_items_attributes_0_due_date_*';
  due_date_name_base = 'application[schedule_items_attributes][0][due_date(*)]';
  date_fields = ['1i', '2i', '3i'];
  for (i = 0, len = date_fields.length; i < len; i++) {
    sub = date_fields[i];
    start_date_id = start_date_id_base.replace('*', sub);
    start_date_field = new_row.querySelector('#'.concat(start_date_id));
    start_date_id = start_date_id.replace('0', msec);
    start_date_name = start_date_name_base.replace('*', sub).replace('0', msec);
    start_date_field.setAttribute('id', start_date_id);
    start_date_field.setAttribute('name', start_date_name);
    due_date_id = due_date_id_base.replace('*', sub);
    due_date_field = new_row.querySelector('#'.concat(due_date_id));
    due_date_id = due_date_id.replace('0', msec);
    due_date_name = due_date_name_base.replace('*', sub).replace('0', msec);
    due_date_field.setAttribute('id', due_date_id);
    due_date_field.setAttribute('name', due_date_name);
  }
  start_date_label = new_row.querySelector('[for="application_schedule_items_attributes_0_start_date_1i"]');
  start_date_label.setAttribute('for', start_date_id_base.replace('0', msec).replace('*', '1i'));
  due_date_label = new_row.querySelector('[for="application_schedule_items_attributes_0_due_date_1i"]');
  due_date_label.setAttribute('for', due_date_id_base.replace('0', msec).replace('*', '1i'));
  todo_field = new_row.querySelector('#application_schedule_items_attributes_0_todo');
  todo_field.setAttribute('id', todo_id);
  todo_field.setAttribute('name', todo_name);
  todo_label = new_row.querySelector('[for="application_schedule_items_attributes_0_todo"]');
  todo_label.setAttribute('for', todo_id);
  return new_row;
};

new_role_row = function(row) {
  var date, first_name_field, first_name_id, first_name_label, first_name_name, last_name_field, last_name_id, last_name_label, last_name_name, member_role_field, member_role_id, member_role_label, member_role_name, msec, new_row;
  new_row = row.cloneNode(true);
  date = new Date();
  msec = date.getTime();
  member_role_id = 'application_roles_attributes_0_member_role'.replace('0', msec);
  member_role_name = 'application[roles_attributes][0][member_role]'.replace('0', msec);
  first_name_id = 'application_roles_attributes_0_first_name'.replace('0', msec);
  first_name_name = 'application[roles_attributes][0][first_name]'.replace('0', msec);
  last_name_id = 'application_roles_attributes_0_last_name'.replace('0', msec);
  last_name_name = 'application[roles_attributes][0][last_name]'.replace('0', msec);
  member_role_field = new_row.querySelector('#application_roles_attributes_0_member_role');
  member_role_field.setAttribute('id', member_role_id);
  member_role_field.setAttribute('name', member_role_name);
  member_role_label = new_row.querySelector('[for="application_roles_attributes_0_member_role"]');
  member_role_label.setAttribute('for', member_role_id);
  first_name_field = new_row.querySelector('#application_roles_attributes_0_first_name');
  first_name_field.setAttribute('id', first_name_id);
  first_name_field.setAttribute('name', first_name_name);
  first_name_label = new_row.querySelector('[for="application_roles_attributes_0_first_name"]');
  first_name_label.setAttribute('for', first_name_id);
  last_name_field = new_row.querySelector('#application_roles_attributes_0_last_name');
  last_name_field.setAttribute('id', last_name_id);
  last_name_field.setAttribute('name', last_name_name);
  last_name_label = new_row.querySelector('[for="application_roles_attributes_0_last_name"]');
  last_name_label.setAttribute('for', last_name_id);
  return new_row;
};

$(function() {
  var experiences_row, role_row, schedule_items_row;
  $('#application_amount_applied_for').on('input', function() {
    var sum;
    sum = sum_amounts($('#application_amount_applied_for').val(), $('#application_amount_other_sources').val());
    return $('#application_amount_overall').val(sum);
  });
  $('#application_amount_other_sources').on('input', function() {
    var sum;
    sum = sum_amounts($('#application_amount_applied_for').val(), $('#application_amount_other_sources').val());
    return $('#application_amount_overall').val(sum);
  });
  role_row = document.querySelector('.role_row').cloneNode(true);
  schedule_items_row = document.querySelector('.schedule_items_row').cloneNode(true);
  experiences_row = document.querySelector('.experiences_row').cloneNode(true);
  $('#add_member').on('click', function() {
    var btn, new_row;
    new_row = new_role_row(role_row);
    btn = document.getElementById('add_member');
    return btn.parentNode.insertBefore(new_row, btn);
  });
  $('#add_schedule_item').on('click', function() {
    var btn, new_row;
    new_row = new_schedule_item_row(schedule_items_row);
    btn = document.getElementById('add_schedule_item');
    return btn.parentNode.insertBefore(new_row, btn);
  });
  $('#add_experience').on('click', function() {
    var btn, new_row;
    new_row = new_experiences_row(experiences_row);
    btn = document.getElementById('add_experience');
    return btn.parentNode.insertBefore(new_row, btn);
  });
  return $(document).on('click', '.remove_row', function() {
    return this.parentNode.remove();
  });
});
