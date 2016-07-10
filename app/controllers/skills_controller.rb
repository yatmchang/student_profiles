class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @skill      = Skill.new skill_params
    if @skill.save
      redirect_to skill_path(@skill, anchor: 'skill'), notice: "Your information has successfully saved!"
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
    @skill.destroy
    redirect_to new_skill_path, notice: "Your skill information has been deleted"
  end

  def update
    if @skill.update skill_params
      redirect_to skill_path(@skill), notice: "Your information has been updated"
    else
      render :edit
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:title, :rating)
  end

  def find_skill
    @skill = Skill.find params[:id]
  end
end
