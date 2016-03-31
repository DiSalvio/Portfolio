class ProjectsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy, :new, :create]
  before_action :set_admin
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :get_projects, only: [:index, :create, :update]

  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.create(project_params)

    respond_to do |format|
      if @project.valid?
        format.html { redirect_to @project }
        format.js
      else
        format.html { redirect_to :new }
	format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project successfully created' }
	format.json { render :show, status: :ok, location: @project }
	format.js
      else
        format.html { render :edit }
	format.json { render json: @project.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project successfully deleted.' }
      format.json { head :no_content }
      format.js
    end
  end

  def drafts
    get_drafts
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def set_admin
    @admin = Admin.first
  end

  def set_project
    @project = Project.find_by(name: params[:name])
  end

  def get_projects
    @projects = Project.where(published: true).order(created_at: :asc)
  end
 
  def get_drafts
    @projects = Project.where(published: false).order(created_at: :asc)
  end

  def project_params
    params[:project].permit(:id, :name, :description, :published)
  end
end
