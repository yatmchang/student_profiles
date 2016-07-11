  class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :create, :index]

  def new
    @user = User.new
  end

  def create

    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "You're now signed up!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @skills = @user.skills
    @projects = @user.profile.projects
    @educations = @user.profile.educations
    @experiences = @user.profile.experiences
  end

  def edit
    @user = current_user
    @profile = @user.profile
    @skills = current_user.skills
    @skill = Skill.new
    @projects = current_user.projects
    @project = Project.new
    @educations = current_user.educations
    @education = Education.new
    @experiences = current_user.experiences
    @experience = Experience.new
    @links = current_user.links
    @link = Link.new
  end

  def update
    @user = current_user
    @profile = @user.profile
    if @user.update user_params
      redirect_to root_path, notice: "Account updated!"
    else
      flash[:alert] = "Unable to update account."
      render :edit
    end
  end

  def index
    # if params[available: true]
    #   @users = User.where(available: true)
    # else
      @users = User.order("first_name ASC").page(params[:page]).per(16)
    # end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
