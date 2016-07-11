class ExperiencesController < ApplicationController
  before_action :find_experience, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @experiences = Experience.order(created_at: :desc)
    @experience = Experience.new
  end

  def create
    @experience = Experience.new experience_params
    @experiences = Experience.order(created_at: :desc)
    @profile = current_user.profile
    @experience.profile_id = @profile.id
    if @experience.save
      redirect_to edit_user_path(current_user), notice: "Changes Saved!"
    else
      redirect_to edit_user_path(current_user), alert: "Unable To Save"
    end
  end

  def show
  end

  def update
    if @experience.update experience_params
      redirect_to edit_user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def destroy
    @experience.destroy
    redirect_to edit_user_path(current_user)
  end

  private

  def experience_params
    params.require(:experience).permit(:job_title, :company, :start_date, :end_date, :current, :description)
  end

  def find_experience
    @experience = Experience.find params[:id]
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @experience
  end
end
