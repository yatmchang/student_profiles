class EducationsController < ApplicationController
  before_action :find_education, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @educations = Education.all
  end

  def new
    @education = Education.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @education = Education.new education_params
    @profile = current_user.profile
    @education.profile_id = @profile.id
    if @education.save
      redirect_to edit_user_path(current_user), notice: "Changes Saved!"
    else
      redirect_to edit_user_path(current_user), alert: "Unable To Save"
    end
  end

  def edit
  end

  def show
  end


  def destroy
    @education.destroy
    redirect_to new_education_path, notice: "Your education information has been deleted"
  end

  def update
    if @education.update education_params
      redirect_to education_path(@education), notice: "Your information has been updated"
    else
      render :edit
    end
  end

  private

  def education_params
    params.require(:education).permit(:school, :description, :logo, :link, :start_date, :end_date, :current)
  end

  def find_education
    @education = Education.find params[:id]
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @education
  end

end
