class ProjectsController < ApplicationController



def new
  @project = Project.new
end

def create
    @project = Project.new project_params
    # @project.aauser = current_user
  if @project.save
    flash[:notice] = "Sucessful"
    redirect_to project_path(id: @project)
  else
    flash[:alert]= "not created!"
    render :new
  end
end

def edit
 @project = Project.find params[:id]
end

def update
   @project = Project.find params[:id]
  if @project.update project_params
    redirect_to project_path(@project), notice: "updated"
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




def project_params
   params.require(:project).permit(:title, :description, :web_app_link, :github_link, :logo)
 end




end
