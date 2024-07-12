# class AddUserRolesCustomField < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
class AddUserRolesCustomField < ActiveRecord::Migration[5.2]
  def self.up
    field = CustomField.new(
      name: 'User Roles',
      field_format: 'string',
      type: 'TimeEntryCustomField',
      is_for_all: true,
      is_filter: false,
      default_value: '',
      editable: true,
      visible: true,
      description: ''
    )

    field.save(validate: false)
  end

  def self.down
    field = CustomField.find_by(name: 'User Roles')
    field.destroy if field
  end
end
