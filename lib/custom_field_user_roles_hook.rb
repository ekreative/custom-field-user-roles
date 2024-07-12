class CustomFieldUserRolesHook < Redmine::Hook::ViewListener

  def view_layouts_base_html_head(context={})
    html = "\n<!-- [custom field user roles plugin] -->\n"
    html << stylesheet_link_tag("user_roles", plugin: "custom_field_user_roles")
    html << javascript_include_tag("user_roles.js", plugin: "custom_field_user_roles")
    return html
  end
end
