class ExperiencesController < ApplicationController

  before_action :find_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.order(created_at: :desc)
    @experience = Experience.new
  end

  def new
    @experience = Experience.new
  end

  def show
  end

  def create
    @experience = Experience.new experience_params
    @experiences = Experience.order(created_at: :desc)
    # @experience.user = current_user
    if @experience.save
      redirect_to experiences_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @experience.update experience_params
      redirect_to experiences_path
    else
      render :edit
    end
  end

  def destroy
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def experience_params
    params.require(:experience).permit(:job_title, :company, :start_date, :end_date, :current, :description)
  end

  def find_experience
    @experience = Experience.find params[:id]
  end
end
