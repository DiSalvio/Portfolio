class PagesController < ApplicationController
  

  def home
    get_admin
    get_project_names
  end

  private
  def get_project_names
    @project_names = Project.where(published: true).order(created_at: :asc).pluck(:name)
  end

  def get_admin
    @admin = Admin.first
  end
end
