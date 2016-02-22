class ProjectsController < ApplicationController
  respond_to :html
  before_action :set_admin

  def portfolio
  end

  def bqbl
  end

  def differentia
  end

  private
  def set_admin
    @admin = Admin.first
  end
end
