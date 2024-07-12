$(document).ready(function() {
  $('#time_entry_custom_field_values_16').prop('readonly', true);

  function getProjectIdFromBodyClass() {
    var projectClass = $('body').attr('class').split(' ').find(cls => cls.startsWith('project-'));

    return projectClass ? projectClass.replace('project-', '') : null;
  }

  function setUserRolesInField(userId, projectId) {
    var rolesField = $('#time_entry_custom_field_values_16');
    var url;

    if (userId) {
      url = '/custom_field_user_roles/user_roles/' + userId + '?project_id=' + projectId;
    } else {
      url = '/custom_field_user_roles/current_user_roles?project_id=' + projectId;
    }

    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        rolesField.val(data.roles);
      },
      error: function(e) {
        console.error('Error fetching user roles:', e);
      }
    });
  }

  if (window.location.href.includes('bulk_edit')) {
    var projectId = getProjectIdFromBodyClass();
    var firstTimeEntryUrl = $('#bulk-selection li:nth-child(1) a').attr('href');
    var firstTimeEntryId = firstTimeEntryUrl.match(/\/time_entries\/(\d+)/)[1];

    $.ajax({
      url: '/custom_field_user_roles/bulk_edit_user_roles?time_entry_id=' + firstTimeEntryId,
      type: 'GET',
      dataType: 'json',
      success: function(data) {
        setUserRolesInField(data.user_id, projectId);
      },
      error: function(e) {
        console.error('Error fetching time entry:', e);
      }
    });

    var comment = $("<div id='roles_comment' style='margin-top: 5px; color: #888; font-size: 0.9em;'>Roles will be taken from the first user in the list.</div>");
    $('#time_entry_custom_field_values_16 + .inline').after(comment);
  } else {
    if ($('#time_entry_custom_field_values_16').length > 0) {
      var projectId = getProjectIdFromBodyClass();

      $('#time_entry_user_id').change(function() {
        var userId = $(this).val();
        setUserRolesInField(userId, projectId);
      });

      var userId = $('#time_entry_user_id').val();
      setUserRolesInField(userId, projectId);
    }
  }
});
