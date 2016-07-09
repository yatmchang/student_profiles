class ExperiencesController < ApplicationController

  before_action :find_experience, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @experience = Experience.new
  end

  def show
  end

  def create
    @experience = Experience.new experience_params
    @experience.user = current_user
    @experience.save
  end

  def edit
  end

  def update
    @experience.update experience_params
  end

  def destroy
    @experience.destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:title, :company, :start_date, :end_date, :current, :description)
  end

  def find_experience
    @experience = Experience.find params[:id]
  end
end
