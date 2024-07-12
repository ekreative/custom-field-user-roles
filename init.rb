Redmine::Plugin.register :custom_field_user_roles do
  name 'Custom Field User Roles plugin'
  author 'Sasha Chyrskyy'
  description 'A plugin for dynamically updating the field with user roles'
  version '1.0'
end

require_dependency File.dirname(__FILE__) + '/lib/custom_field_user_roles_hook'

# initializer 'custom_field_user_roles.add_migrations' do
#   config.paths['db/migrate'].concat(File.expand_path('../db/migrate', __FILE__))
# end
