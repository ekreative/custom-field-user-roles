class CustomFieldUserRolesController < ApplicationController
  before_action :find_user, only: [:user_roles]

  def user_roles
    project = Project.find(params[:project_id])
    roles = @user.roles_for_project(project).map(&:name).join(', ')
    render json: { roles: roles }
  end

  def current_user_roles
    project = Project.find(params[:project_id])
    roles = User.current.roles_for_project(project).map(&:name).join(', ')
    render json: { roles: roles }
  end

  def bulk_edit_user_roles
    time_entry = TimeEntry.find(params[:time_entry_id])
    user = time_entry.user
    render json: { user_id: user.id }
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
