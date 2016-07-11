class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

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

#   if @project.save
#     flash[:notice] = "Sucessful"
#     redirect_to user_profile_project_path(current_user, @profile, @project)
#   else
#     flash[:alert]= "not created!"
#     render :new
# >>>>>>> testing
end

def edit
 @profile  = current_user.profile
 @projects = current_user.projects
 @project  = Project.find params[:id]
end

def update
   @profile = current_user.profile
   @project = Project.find params[:id]
  if @project.update project_params
    redirect_to user_profile_project_path(current_user, @profile, @project), notice: "updated"
  else
    render :edit
  end
end

def show
  @profile = current_user.profile
  @project = Project.find params[:id]
end
def destroy
  @project = Project.find params[:id]
  @project.destroy
  redirect_to current_user, notice: "destroyed"
end

  def update
     @project = Project.find params[:id]
    if @project.update project_params
      redirect_to current_user, notice: "updated"
    else
      render :edit
    end
  end

  def show
    @project = Project.find params[:id]
  end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path, notice: "destroyed"
  end

  private

  def project_params
     params.require(:project).permit(:avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :title, :description, :web_app_link, :github_link, :logo, {project_tag_ids: []})
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @project
  end

end
