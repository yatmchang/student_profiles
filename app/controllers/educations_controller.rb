class EducationsController < ApplicationController
  before_action :find_education, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

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
    @education      = Education.new education_params
    # @education.user = current_user
    if @education.save
      redirect_to education_path(@education), notice: "Your information has successfully saved!"
    else
      flash[:alert] = "Sorry, a problem occured while saving your information, please try again."
      render :new
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
end
