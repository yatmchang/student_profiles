class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @skills = Skill.all
    respond_to do |format|
      format.html { render @skills}
      format.json { render json: @skills}
    end
  end

  def new
    @skill = Skill.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @skill = Skill.new skill_params
    @profile = current_user.profile
    @skill.profile_id = @profile.id
    if @skill.save
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

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @skill
  end
end
