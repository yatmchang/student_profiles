class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]
  before_action :find_project
  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @profile = current_user.profile
    @project.profile = @profile

    if @project.save
      redirect_to edit_user_path(current_user), notice: "Changes Saved!"
    else
      redirect_to edit_user_path(current_user), alert: "Unable To Save"
    end
end

def edit
 @profile  = current_user.profile
 @projects = current_user.projects
end

def update
   @profile = current_user.profile
  if @project.update project_params
    redirect_to user_profile_project_path(current_user, @profile, @project), notice: "updated"
  else
    render :edit
  end
end

  def show
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to current_user, notice: "destroyed"}
      format.json { head :no_content }
    end
  end

  private

  def project_params
     params.require(:project).permit(:avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :title, :description, :web_app_link, :github_link, :logo, {project_tag_ids: []})
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @project
  end

end
