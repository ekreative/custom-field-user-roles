RedmineApp::Application.routes.draw do
  get 'custom_field_user_roles/user_roles/:id', to: 'custom_field_user_roles#user_roles', as: 'custom_field_user_roles'
  get 'custom_field_user_roles/current_user_roles', to: 'custom_field_user_roles#current_user_roles', as: 'current_user_roles'
  get 'custom_field_user_roles/bulk_edit_user_roles', to: 'custom_field_user_roles#bulk_edit_user_roles', as: 'bulk_edit_user_roles'
end
